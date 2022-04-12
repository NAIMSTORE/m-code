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
clear
echo -e ""
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e "        ═══[TROJAN TCP TLS]═══"
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e " 1)  Create Trojan TCP TLS Account"
echo -e " 2)  Deleting Trojan TCP TLS Account"
echo -e " 3)  Renew Xray Trojan TCP TLS Account"
echo -e " 4)  Check User Login Trojan TCP TLS"
echo -e ""
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e "           ═══[TROJAN GRPC]═══"
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e " 5)  Create Trojan GRPC Account"
echo -e " 6)  Deleting Trojan GRPC Account"
echo -e " 7)  Renew Xray Trojan GRPC Account"
echo -e " 8)  Check User Login Trojan GRPC"
echo -e ""
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e " x)   MENU"
echo -e "\e[32m════════════════════════════════════════\e[m"
echo -e ""
read -p "     Please Input Number  [1-8 or x] :  "  xtr
echo -e ""
case $xtr in
1)
add-xtr
;;
2)
del-xtr
;;
3)
renew-xtr
;;
4)
cek-xtr
;;
5)
add-trgr
;;
6)
del-trgr
;;
7)
renew-trgr
;;
8)
cek-trgr
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
