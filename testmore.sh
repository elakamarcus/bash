#!/bin/bash
# designed for use in Kali Linux~~

target=$1
if [ "$1" = ""]; then
 q=/dev/random
 echo $q
else

echo "scanning~"
echo "http enum~"
echo "zone~"
echo "nmap --script=/usr/share/nmap/scripts/dns-check-zone.nse"
echo "nmap --script=/usr/share/nmap/scripts/dns-zone-transfer.nse"

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
fi