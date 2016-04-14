#! /usr/bin/env bash

mkdir /tmp/spark-events/
/generate-keys.sh
/usr/sbin/sshd -f /etc/ssh/sshd_config
/usr/local/spark/run-spark.sh
