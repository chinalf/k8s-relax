# 撤销的目录共享出去
echo "" >  /etc/exports

#刷新配置
exportfs -arv

# 删除共享目录
rm -rf /u01/*
