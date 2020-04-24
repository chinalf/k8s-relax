kubectl create -f /opt/yaml/ns.yaml
kubectl create -f /opt/yaml/pgSlave-volume.yaml
kubectl create -f /opt/yaml/pgMaster-volume.yaml
kubectl create -f /opt/yaml/relax-volume.yaml
kubectl create -f /opt/yaml/dbbackup-volume.yaml
sleep 120s
kubectl create -f /opt/yaml/pgMaster.yaml
kubectl create -f /opt/yaml/redis.yaml
sleep 300s
kubectl create -f /opt/yaml/relax.yaml
sleep 300s
kubectl create -f /opt/yaml/nginx.yaml
kubectl create -f /opt/yaml/pgSlave.yaml

