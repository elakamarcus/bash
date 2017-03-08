# nmap vs mysql
nsescripts=$(locate *mysql*\.nse)

echo "[!] Remember direct stdout to filename."
sleep 2

function run () {
 for n in ${nsescripts[@]}
   do 
     echo "nmap -sS -p $dstp $target --script=$n"
 done
}

if [[ -z "$1" || "$3" ]]; then
   echo "need server and port. E.g. $ %0 <IP> <PORT>"
  exit 1
else
  if [[ "$2" ]]; then
    dstp="$2"
  else
    dstp="3306"
  fi
  run
fi
