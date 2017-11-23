#!/usr/bin/env bash

now=$(date +'%Y%m%d')
useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"

function run () {
	echo [+] Using URL $url
	echo [+] Using UA: "$useragent"
	cewl -w temp.$now -e --email_file email.$now -u "$useragent" $url
	echo [-] no error checking, sorry.
	echo [!] tidy up...
	tr '[:upper:]' '[:lower:]' < temp.$now > temp.lower.$now
	grep -e "[A-Za-z]" temp.lower.$now | sort | uniq > wordlist.$now
	rm temp.$now temp.lower.$now
	echo [+] Check the files:
	echo [+] wordlist: wordlist.$now, email: email.$now
	echo [!] Hint: Use with Korelogic rules and john

}
if [[ "$1" =~ "http://" || "$1" =~ "https://" || "$1" =~ "www" ]]; then
	url=$1
	run
elif [[ -z "$1" ]]; then
	echo Need URL... http(s)://... www...
	exit 1
fi
