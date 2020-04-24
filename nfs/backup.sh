# 备份App
times=$(date '+%Y%m%d%H%M%S')
mkdir -p /u01/relax$times

cp -rf /u01/relax/relax/program  /u01/relax$times/
cp -rf /u01/relax/relax/workspace  /u01/relax$times/

