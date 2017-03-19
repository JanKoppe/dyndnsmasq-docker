#!/bin/sh

# start dnsmasq in background and save pid
dnsmasq -k --log-facility=- -h -H /etc/hosts.dyn "$@" &
PID=$!

# handle signals
trap "kill -s TERM $PID" SIGINT SIGTERM

# when hosts file is modified, signal dnsmasq to reload.
while inotifywait -e modify,create /etc/hosts.dyn; do
  kill -s HUP $PID
done


