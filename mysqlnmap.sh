#!/bin/bash
# nmap vs mysql
qwasd=$(locate *mysql*\.nse | sed -e 'H;${x;s/\n/,/g;s/^,//;p;};d')

function run () {
 echo "nmap -sS -sV -p $dstp $target --script=$qwasd -oA $target"
}

if [[ -z "$1" || "$3" ]]; then
   echo "need server and port. E.g. $ %0 <IP> <PORT>"
  exit 1
else
  echo "[!] Remember direct stdout to filename."
  target=$1
  echo "[+] Will target "$target" with mysql nse in 2 seconds."
  sleep 2
  if [[ "$2" ]]; then
    dstp="$2"
  else
    dstp="3306"
  fi
  run
fi

