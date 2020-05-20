# 备份App
cd /u01
times=$(date '+%Y%m%d%H%M%S')
mkdir -p /u01/relax-back$times

cp -rf /u01/relax/relax/program  /u01/relax-back$times/
cp -rf /u01/relax/relax/workspace  /u01/relax-back$times/

ls -t  |grep 'relax-back' | awk 'NR>14' | xargs rm -rf

