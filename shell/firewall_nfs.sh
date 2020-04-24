firewall-cmd --permanent --add-port=111/tcp
firewall-cmd --permanent --add-port=2049/tcp
firewall-cmd --permanent --add-port=111/udp
firewall-cmd --permanent --add-port=4046/udp
systemctl restart firewalld
