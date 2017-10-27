#!/bin/bash

#
# TODO
#  - parameter for ports
#  - default ports if no custom set
#  
#

target=$1

function run {
  for a in /usr/share/nmap/scripts/http*enum*.nse; do
    if [ "$a" = *"vuln"* ]; then
      $b=$b
    else
      p=$(echo $a | awk -F"/" '{print $NF}')
      nmap --script=$a $target -p80,443 -P0 -oA $target.$p
    fi
  done
}

if [[ $1 ]]; then
  run()
else
  echo "Missing parameter: target."
exit 0

