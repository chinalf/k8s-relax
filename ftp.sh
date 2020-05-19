#!/bin/bash

FTILE_NAME=$1
ftp -n <<- EOF
open 172.17.189.72
user ruijie 1qa@WS3ed
mkdir relax/develop/V$2/install/product/online_office_hall_cluster
cd relax/develop/V$2/install/product/online_office_hall_cluster
bin
put $1
bye
EOF
