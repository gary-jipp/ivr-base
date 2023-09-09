#!/bin/bash
#
#  This script runs at container start
#
logpath=/var/log/fastagi
logfile=$logpath/fastagi.log
if [ ! -d "$logpath" ];  then
  logfile=/dev/null
fi

function stop() {
  echo `date` "- Stopping container"| tee -a $logfile
  pkill -15 java
  kill -15 $cronPid

  # Save logrotate status file
  cp -upv /var/lib/logrotate/status /var/log/fastagi/  2> /dev/null
}

function start() {
  echo `date` "- Starting container" | tee -a $logfile
  # Get intial status file if first startup
  cp -upv --preserve /var/log/fastagi/status /var/lib/logrotate/ 2> /dev/null

  cron -f &
  cronPid=$!

  export CLASSPATH=~/app/ivr/*:~/app/lib/*:~/app
  java org.asteriskjava.Cli >> $logfile

  echo `date` "- Container exiting" | tee -a $logfile
  exit 0
}

trap stop SIGTERM SIGQUIT
start
