#!/bin/bash
# Bing Dorking v1
# Coded by xSuxHaxDax a.k.a DayWalker
# Thank's to Zerobyte.id
clear
red='\033[0;31m'
cyan='\033[0;36m'
white='\033[1;37m'
NC='\033[0m'
useragent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/56.0";
cat << "ZERO"
 _____              _           _         _     _ 
|__  /___ _ __ ___ | |__  _   _| |_ ___  (_) __| |
  / // _ \ '__/ _ \| '_ \| | | | __/ _ \ | |/ _` |
 / /|  __/ | | (_) | |_) | |_| | ||  __/_| | (_| |
/____\___|_|  \___/|_.__/ \__, |\__\___(_)_|\__,_|
                          |___/                   
----------- DayWalker [at] zerobyte.id ----------
---------------- Bing Dorking v1 ----------------
-------------------------------------------------

ZERO
printf "${red}ZEROB${white}YTE.id\n";
echo
printf "${NC}Masukan DORK BING : "; read dork;
printf "User Agent : $useragent\n";
printf "Masukan PAGE #MAX 25 : "; read max;
if [ 25 -ge $max ]; then
	printf ${white};
	echo "Getting Started Grab Bing"
	datainput=("$dork" "$useragent" )
		mulai=1
while [ $mulai -le $max ]
	do
		url="http://www.bing.com/search?q=${datainput[0]}&first=${mulai}1&FORM=PERE1"
		curl -q --silent -A "${datainput[1]}" -o data_1.txt $url 2>&1
		cat data_1.txt | egrep -o "<h2><a href=\"[^\"]+" data_1.txt | cut -d '"' -f 2 >> data_2.txt
		rm data_1.txt
		cat data_2.txt | tr '[:upper:]' '[:lower:]' | awk '{gsub("http://","")}1' | awk '{gsub("https://","")}1' | sed '/www./s///g' | cut -d '?' -f 1 | awk '{gsub("/index.php","")}1' | sort | uniq >> data_3.txt
		printf "${cyan}GRAB BING PAGE $mulai"; echo
		sleep 2
	((mulai++))
	done
semua_total=$(cat data_3.txt | wc -l)
	echo "TOTAL KESELURUHAN $semua_total";
	#sort data_3.txt | uniq >> hasil.txt
	cat data_3.txt | cut -d "/" -f 1 >> hasil.txt.txt
	sort hasil.txt.txt | uniq >> all_hasil.txt
filter_total=$(cat all_hasil.txt | wc -l)
	printf "TELAH TERFILTER TOTAL DOMAIN : ${red}$filter_total"; echo
	#rm hasil.txt
	printf "${red}ZEROB${white}YTE.id";
	echo
	printf ${NC}
	rm hasil.txt.txt
	rm data_2.txt
	rm data_3.txt
else
	echo "MAX 25 PAGES"
fi