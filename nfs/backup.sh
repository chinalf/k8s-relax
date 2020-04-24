# 备份App
times=$(date '+%Y%m%d%H%M%S')
mkdir -p /u01/relax$times

cp -rf /u01/relax/program  /u01/relax$times/
cp -rf /u01/relax/workspace  /u01/relax$times/

