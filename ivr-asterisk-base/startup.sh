#!/bin/bash
#
#  This script runs at container start
#
function stop() {
  echo `date` "- Stopping ..."
  service asterisk stop
  kill -15 $cronPid

  # Save logrotate status file
  cp -upv /var/lib/logrotate/status /var/log/asterisk/  2> /dev/null
}

function start() {
  echo `date` "- Starting container"
  # Get intial status file if first startup
  cp -upv --preserve /var/log/asterisk/status /var/lib/logrotate/ 2> /dev/null

  # Correct any bad permissions
  chown -R asterisk /var/log/asterisk
  service asterisk start

  cron -f &
  cronPid=$!
  wait $cronPid
  echo `date` "- Container exiting"
  exit 0
}

trap stop SIGTERM SIGQUIT
start
