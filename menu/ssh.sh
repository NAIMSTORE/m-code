#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NAIMSTORE"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/ipxray/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/ipxray/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e "          \e[1;31m\e[1;31m═[\e[mSSH & OpenVPN Menu\e[1;31m]═\e[m" 
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e "  1\e[1;33m)\e[m Create SSH & OpenVPN Account"
echo -e "  2\e[1;33m)\e[m Trial Account SSH & OpenVPN"
echo -e "  3\e[1;33m)\e[m Renew SSH & OpenVPN Account"
echo -e "  4\e[1;33m)\e[m Delete SSH & OpenVPN Account"
echo -e "  5\e[1;33m)\e[m Check User Login SSH & OpenVPN"
echo -e "  6\e[1;33m)\e[m List Member SSH & OpenVPN"
echo -e "  7\e[1;33m)\e[m Delete User Expired SSH & OpenVPN"
echo -e "  8\e[1;33m)\e[m Set up Autokill SSH"
echo -e "  9\e[1;33m)\e[m Cek Users Who Do Multi Login SSH"
echo -e " 10\e[1;33m)\e[m User List"
echo -e " 11\e[1;33m)\e[m User Lock"
echo -e " 12\e[1;33m)\e[m User Unlock"
echo -e " 13\e[1;33m)\e[m User Password"
echo -e " 14\e[1;33m)\e[m Restart Service Dropbear, Squid3"
echo -e "     OpenVPN dan SSH"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
read -p "     Please Input Number  [1-14 or x] :  "  ssh
echo -e ""
case $ssh in
1)
add-ssh
;;
2)
trial
;;
3)
renew-ssh
;;
4)
del-ssh
;;
5)
cek-ssh
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
user-list
;;
11)
user-lock
;;
12)
user-unlock
;;
13)
user-password
;;
14)
restart
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
