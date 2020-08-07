#!/bin/bash
echo "Num of params: $#"

if [ $# -lt 2 ]
then
        echo "Not enough parameters, need remote_port local_port "
else
        echo "Starting ssh remote tunnel..."
        autossh -o ServerAliveInterval=60 -o ServerAliveCountMax=2 -NR $1:localhost:$2 -i ~/.ssh/tencent-server ubuntu@193.112.209.169
fi