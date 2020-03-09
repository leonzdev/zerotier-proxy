#!/bin/bash
# start zerotier service
zerotier-one -d

# start squid
squid

# execute additional commands
if [[ ! -z ${1} ]]; then
  eval "$@"
fi

while sleep 60; do
  ps aux | grep zerotier |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep squid |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done

