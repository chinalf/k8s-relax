#停止nfs服务
systemctl stop nfs-server.service
systemctl stop rpcbind.service

#安装nfs服务
rpm -ivh /tmp/nfs/rpm/*.rpm --force --nodeps

#将服务添加到系统启动
systemctl enable rpcbind.service
systemctl enable nfs-server.service

#启动nfs服务
systemctl start rpcbind.service
systemctl start nfs-server.service

