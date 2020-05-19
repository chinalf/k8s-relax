(crontab -l;echo "0 3 * * * /opt/backup.sh >> /opt/check.log 2>&1") | crontab

kubectl create -f /opt/yaml/ns.yaml

if [ -f "/opt/yaml/ceph-secret.yaml" ];then
  kubectl create -f /opt/yaml/ceph-secret.yaml
fi

kubectl create -f /opt/yaml/pgSlave-volume.yaml
kubectl create -f /opt/yaml/pgMaster-volume.yaml
kubectl create -f /opt/yaml/relax-volume.yaml
kubectl create -f /opt/yaml/dbbackup-volume.yaml
sleep 60s
kubectl create -f /opt/yaml/pgMaster.yaml
kubectl create -f /opt/yaml/redis.yaml
sleep 60s
kubectl create -f /opt/yaml/relax.yaml
sleep 180s
kubectl create -f /opt/yaml/nginx.yaml
kubectl create -f /opt/yaml/pgSlave.yaml

