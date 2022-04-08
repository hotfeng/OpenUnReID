#!/usr/bin/env bash

set -x  # print following script logs to screen

PYTHON=${PYTHON:-"python"}  # ":-"表示缺省值. ${var:-string}:若变量var为空或者未定义,则用在命令行中用string来替换${var:-string} 

METHOD=$1
WORK_DIR=$2
PY_ARGS=${@:3}  # 脚本的所有参数中, 从第3个位置[0,1,2,3,...]开始的子字符串

GPUS=${GPUS:-4}

while true # find unused tcp port
do
    PORT=$(( ((RANDOM<<15)|RANDOM) % 49152 + 10000 ))
    status="$(nc -z 127.0.0.1 $PORT < /dev/null &>/dev/null; echo $?)"
    if [ "${status}" != "0" ]; then
        break;
    fi
done

# https://pytorch.org/docs/stable/distributed.html#launch-utility
# torch.distributed.launch: 为每个训练节点启动多个进程实现分布式训练
$PYTHON -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT --use_env \
$METHOD/main.py $METHOD/config.yaml --work-dir=${WORK_DIR} \
    --launcher="pytorch" --tcp-port=${PORT} --set ${PY_ARGS}
