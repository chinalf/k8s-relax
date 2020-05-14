ansible-playbook /opt/install/ansible_yaml/ansible_nfs_backup.yaml
kubectl create -f /opt/yaml/backup.yaml

sleep 300
for i in {1..720}
do
  master=`kubectl get pods -n ruijie-itone|grep dbbackup|grep Running|awk '{print $1}'`
  echo "$i-----------------------$master"
  para1=
  if [ -z $master ]; then
    echo "Database backup over!"
    exit
  else
    echo "Database backup in progress..."
    sleep 30
  fi
done

