#!/bin/bash

#配置开始
subNetwork="&&subNetwork"
cephDev="&&cephDev"
cephAll="&&cephAll"

cephAllName=""
cephA=(${cephAll//,/ })
number=${#cephA[*]}
for i  in $(seq 1 $number)
do
  cephAllName="$cephAllName ceph-$i"
done


# install
rpm -ivh /tmp/ceph/ceph-deploy/* --nodeps --force


mkdir -p /home/cluster
cd /home/cluster/
ceph-deploy new $cephAllName
# 修改ceph.conf，执行命令
echo "public_network=$subNetwork" >>  ceph.conf
ceph-deploy mon create-initial
ceph-deploy admin $cephAllName
ceph -s

#安装osd
ceph-volume lvm zap $cephDev
for i  in $(seq 1 $number)
do
  ceph-deploy osd create ceph-$i --bluestore --data $cephDev
done

#配置mgr
ceph-deploy mgr create $cephAllName

#启动dashboard
ceph mgr module enable dashboard

#部署cephfs
ceph-deploy mds create $cephAllName

ceph osd pool create relax_data 128
ceph osd pool create relax_metadata 64 64
ceph fs new relax relax_metadata relax_data

sleep 20s

output=`ceph auth get-or-create client.admin|sed 's/[ ][ ]*/;/g'`
secret=`echo $output | cut -d \; -f 3`
echo $secret > /etc/ceph/admin.secret

mkdir /u01/
mount -t ceph $cephAll:/ /u01/ -o name=admin,secretfile=/etc/ceph/admin.secret
mkdir /u01/relax
mkdir /u01/dbbackup
mkdir /u01/pgSlave
mkdir /u01/pgMaster


key=`ceph auth get-key client.admin | base64`
echo "apiVersion: v1" > /opt/ceph-secret.yaml
echo "kind: Secret" >> /opt/ceph-secret.yaml
echo "metadata:" >> /opt/ceph-secret.yaml
echo "  name: ceph-secret" >> /opt/ceph-secret.yaml
echo "  namespace: ruijie-itone" >> /yaml/ceph-secret.yaml
echo "data:" >> /opt/ceph-secret.yaml
echo "  key: $key" >> /opt/ceph-secret.yaml

ansible-playbook /tmp/ceph/ansible_secret.yaml

