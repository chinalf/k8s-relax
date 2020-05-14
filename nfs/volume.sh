#需要建立的目录
mkdir -p /u01/pg/dbslave/data
mkdir -p /u01/pg/dbmaster/data
mkdir -p /u01/pg/dbbackup
mkdir -p /u01/relax

#把建立的目录共享出去
echo "/u01/pg/dbmaster/data *(rw,no_root_squash,no_all_squash,sync)" >>  /etc/exports
echo "/u01/pg/dbslave/data *(rw,no_root_squash,no_all_squash,sync)" >>  /etc/exports
echo "/u01/pg/dbbackup *(rw,no_root_squash,no_all_squash,sync)" >>  /etc/exports
echo "/u01/relax *(rw,no_root_squash,no_all_squash,sync)" >>  /etc/exports

#刷新配置
exportfs -arv
