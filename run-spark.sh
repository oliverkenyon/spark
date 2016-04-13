#! /usr/bin/env bash

export SPARK_MASTER_IP=`awk 'END {print}' /etc/hosts | awk '{print \$1}'`
export LOGFILE=`./sbin/start-master.sh | awk '{print \$5}'`

./sbin/start-slaves.sh

tail -f $LOGFILE
