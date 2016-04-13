#! /usr/bin/env bash

/generate-keys.sh
/usr/sbin/sshd -f /etc/ssh/sshd_config
/usr/local/spark/run-spark.sh
