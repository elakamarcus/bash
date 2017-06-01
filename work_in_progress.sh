#!/usr/bin/env bash
function run_ip () {
  echo "nmap -sV "$1" --script=discovery,default,auth,vuln -oA" $1
}
function run_host () {
  run_ip $1
}
function run_list () {
  echo "nmap -sV -iL"$1" --script=discovery,default,auth,vuln -oA" $1
}

if [[ -z "$1" || "$2" ]]; then
   echo "need target IP or host E.g. $ %0 <IP>"
   echo "alternatively, specify a filename for -iL"
  exit 1
else
  echo "[!] Remember direct stdout to filename."
#check if $1 matches IP, URL or file -- this need review for bash
  if [[ $1 =~ ^[0-255]\.[0-255]\.[0-255]\.[0-255] ]]; then
    echo "[+] Will target "$1" with nmap scans in 2 seconds."
    sleep 2
    run_ip
    # this need review as well
  elif [[ $1 =~ *.lst ]]; then
    echo "[!] treating "$1" as input list of IPs."
    echo "[+] will target IPs in "$1" with nmap scans in 2 seconds"
    sleep 2
    run_list $1
  else
    echo "[!] treating "$1" as hostname."
    run_host $1
  fi
fi
