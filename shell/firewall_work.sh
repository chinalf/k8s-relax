firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=8472/udp
firewall-cmd --permanent --add-port=443/udp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=53/udp
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=9153/tcp
firewall-cmd --add-masquerade --permanent
firewall-cmd --add-masquerade --permanent
firewall-cmd --query-masquerade
firewall-cmd --remove-masquerade
firewall-cmd --permanent --add-port=15010-15014/tcp
systemctl restart firewalld
