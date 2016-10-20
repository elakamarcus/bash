#!/bin/bash
# designed for use in Kali Linux~~

target=$1

for a in /usr/share/nmap/scripts/*http*enum*.nse; do
 if [ "$a" = *"vuln"* ]; then
   $b=$b
 else
   echo "nmap -T5 --script=$a $target"
 fi
done

echo "Slowloris"
echo "nmap -T5 --script=/usr/share/nmap/scripts/http-slowloris-check.nse $target"
echo "nmap -T5 --script=/usr/share/nmap/scripts/http-slowloris.nse $target"

echo "Sql-injection"
echo "nmap -T5 --script=/usr/share/nmap/scripts/http-sql-injection.nse $target"