#!/usr/bin/env bash
#comment
#prepare
SERVER=$1
PORT=$2
DELAY=1
ciphers=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/ /g')
#end prepare

#function
function run () {
  for cipher in ${ciphers[@]}
  do
    result=$(echo -n | openssl s_client -cipher "$cipher" -connect $SERVER:$PORT 2>&1)
    if [[ "$result" =~ ":error" ]]; then
      error=$(echo -n $result | cut -d":" -f6)
    else
      if [[ "$result" =~ "Cipher is ${cipher}" || "$result" =~ "Cipher    :"  ]]; then
        echo "[+]" $cipher
      else
        echo "[-]" $result
      fi
    fi
  sleep $DELAY
  done
}
#end function

echo $SERVER:$PORT

#check parameters
if [[ -z "$1" || -z "$2" ]]; then
  echo need server and port.
  exit 1
else
  run
fi
