#!/bin/bash
# Setup a ssh local proxy. 
# Proxy local port packets to remote server's.
echo "Num of params: $#"

if [ $# -lt 2 ]
then
    echo "Not enough parameters, need local_port remote_port"
else
	echo "Starting ssh local tunnel..."
    autossh -o ServerAliveInterval=60 -o ServerAliveCountMax=2 -NL $1:localhost:$2 -i ~/.ssh/gpu10 ubuntu@193.112.209.169
fi
