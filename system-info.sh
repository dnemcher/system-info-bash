#!/bin/bash

OUTPUT="system_info.txt"

{
echo "----- System Hostname -----"
hostname

echo "----- Operating System -----"
grep PRETTY_NAME /etc/os-release

echo "----- System Uptime -----"
uptime -p

echo "----- Linux Kernel Version -----"
uname -r

echo "----- CPU Information -----"
lscpu | grep "Model name"

echo "----- Memory Information -----"
free -h

echo "----- Network Interface Information -----"
ip addr

echo "----- Filesystem Utilization -----"
df -hT

echo "----- Last 5 Error Logs -----"
grep -i "error" /var/log/syslog | tail -n 5 2>/dev/null || echo "No syslog found"
} > "$OUTPUT"

echo "System info saved to $OUTPUT"
