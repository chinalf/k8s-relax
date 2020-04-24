yum install ntp -y
ntpdate cn.pool.ntp.org
timedatectl set-timezone Asia/Shanghai
timedatectl set-local-rtc 1
timedatectl set-ntp 1
timedatectl status
