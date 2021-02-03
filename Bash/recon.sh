#!/bin/bash

#echo "Enable the sublister and amass by removing the #"

if [ ! -d $1 ]
then
        mkdir $1
fi

cd $1

if [ ! -d $1/recon ]
then
        mkdir recon
fi

if [ ! -d $1/recon/whatweb ]
then
        mkdir recon/whatweb
fi

if [ ! -d $1/recon/nmap ]
then
        mkdir recon/nmap
fi

if [ ! -d $1/recon/gowitness ]
then
        mkdir recon/gowitness
fi

cd recon

echo "[+] harvesting the subdomains using assetfinder"
assetfinder $1 | sort -u >> afop.txt
cat afop.txt > subdomains.txt
rm afop.txt

echo "[+] harvesting the subdomains using sublist3r"
sublist3r -d $1 -o sublist3rop.txt
cat sublist3rop.txt >> subdomains.txt
rm sublist3rop.txt

echo "[+] harvesting the subdomains using amass"
amass enum -d $1 -o aamssop.txt
cat aamssop.txt >> subdomains.txt
rm aamssop.txt

echo "[+] harvesting the subdomains using subfinder"
echo $1 | subfinder -o subfinder.txt
cat subfinder.txt >> subdomains.txt
rm subfinder.txt

echo "[+] harvesting the subdomains using crt.sh"
curl -s https://crt.sh/?q=%.$1 > /tmp/curl.out
cat /tmp/curl.out | grep $1 | grep TD | sed 's/<BR>/\n/g' |sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u > crtsh.txt
cat crtsh.txt >> subdomains.txt
rm crtsh.txt

cat subdomains.txt | sed 's/<BR>/\n/g' | sort -u > allsubenum.txt
rm subdomains.txt

echo "[+] Probing the subdomains using httprobe"
cat allsubenum.txt | httprobe | sort -u > httprobeop_with_http.txt
httprobeop_with_http.txt | sed 's/https\?:\/\///g' | sort -u > httprobeop.txt


echo "[+] Checking for potential subdomain takeover"
subjack -w allsubenum.txt -t 100 -timeout 30 -ssl -c ~/go/src/github.com/haccer/subjack/fingerprints.json -v 3 >> potential_takeovers1.txt

echo "[+] Running whatweb on compiled domains..."
    for domain in $(cat httprobeop.txt);do
        if [ ! -d  "whatweb/$domain" ];then
            mkdir whatweb/$domain
        fi
        if [ ! -d "whatweb/$domain/output.txt" ];then
            touch whatweb/$domain/output.txt
        fi
        if [ ! -d "whaweb/$domain/plugins.txt" ];then
            touch whatweb/$domain/plugins.txt
        fi
        echo "[*] Pulling plugins data on $domain $(date +'%Y-%m-%d %T') "
        whatweb --info-plugins -t 50 -v $domain >> whatweb/$domain/plugins.txt; sleep 3
        echo "[*] Running whatweb on $domain $(date +'%Y-%m-%d %T')"
        whatweb -t 50 -v $domain >> whatweb/$domain/output.txt; sleep 3
    done
echo "[+] Scanning for open ports..."
nmap -iL httprobeop.txt -T4 -oA nmap/scanned

cd gowitness
echo "[+] Taking screenshots of webpages using gowitness"
gowitness file -s $1/recon/httprobeop_with_http.txt -t 5


#Need to add waybackurls