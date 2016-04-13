#! /usr/bin/env bash

export LOGFILE=`./sbin/start-master.sh | awk '{print \$5}'`

./sbin/start-slaves.sh

tail -f $LOGFILE
