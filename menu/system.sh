#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NAIMSTORE"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
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
clear
echo -e ""
echo -e "   \e[32m════════════════════════════════════════\e[m"
echo -e "                \e[30m═[ SYSTEM MENU ]═"
echo -e "   \e[32m════════════════════════════════════════\e[m"
echo -e "    (•1) Add New Subdomain"
echo -e "    (•2) Renew Cert Xray Core"
echo -e "    (•3) Panel Domain"
echo -e "    (•4) Backup Vps"
echo -e "    (•5) Autobackup Vps"
echo -e "    (•6) Restore Vps"
echo -e "    (•7) Install Webmin"
echo -e "    (•8) Setup Speed VPS"
echo -e "    (•9) Restart VPN"
echo -e "    (10) Speedtest VPS"
echo -e "    (11) Info All Port"
echo -e "    (12) Install BBR"
echo -e "    (13) ON/OF Auto Reboot"
echo -e "    (14) Change Password VPS"
echo -e ""
echo -e "   \e[32m════════════════════════════════════════\e[m"
echo -e "    x)   MENU"
echo -e "   \e[32m════════════════════════════════════════\e[m"
echo -e "\e[32m"
read -p "        Please Input Number  [1-14 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
panel-domain
;;
4)
backup
;;
5)
autobackup
;;
6)
restore
;;
7)
wbmn
;;
8)
limit-speed
;;
9)
restart
;;
10)
speedtest
;;
11)
info
;;
12)
bbr
;;
13)
autoreboot
;;
14)
passwd
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
