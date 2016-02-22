#!/usr/bin/env bash
if [[ $1 && $2 ]]; then
  if [[ "$2" = *"url"* ]]; then
    echo "Searching $2 for entries with $1"
    echo "Generate Time,Destination address,Source User,Application,URL,Category" > $1.url.csv
    zgrep $1 $2* | cut -d"," -f7,9,13,15,32,34 >> $1.url.csv
    echo "[+] Check the outfile $1.url.csv"
  elif [ $2 ]; then
    echo "[-] Unknown file, or no file/date specified. You specified - $2"
  fi
  else
    echo " [-] Error: missing argument"
    echo "execute as $0 username FILEPATTERN, example:"
    echo "$0 username PaloAltoFirewall_url_date"
    echo "...to search all of August URL logs for username (case sensitive)."
    echo "Note: instead of username you can define any string to search. Avoid spaces.."
fi
exit 0
