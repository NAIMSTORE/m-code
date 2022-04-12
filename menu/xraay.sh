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
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e "       \e[1;31m\e[1;31m═[\e[mPANEL XRAY VMESS & VLESS GRPC\e[1;31m]═\e[m"
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e "     1\e[1;33m)\e[m  Create Xray Vmess & VLess Grpc Account"
echo -e "     2\e[1;33m)\e[m  Deleting Xray Vmess & VLess Grpc Account"
echo -e "     3\e[1;33m)\e[m  Renew Xray Vmess & VLess Grpc Account"
echo -e "     4\e[1;33m)\e[m  Check User Login Xray Vmess & VLess Grpc"
echo -e ""
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e "    \e[1;31m\e[1;31m═[\e[mXRAY VLESS TCP XTLS(Direct & Splice)\e[1;31m]═\e[m"
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e "     5\e[1;33m)\e[m  Create Xray VLess XTLS Account"
echo -e "     6\e[1;33m)\e[m  Deleting Xray Vless XTLS Account"
echo -e "     7\e[1;33m)\e[m  Renew Xray Vless XTLS Account"
echo -e "     8\e[1;33m)\e[m  Check User Login Xray Vless XTLS"
echo -e ""
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e "    x)   MENU"
echo -e "   \e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
read -p "        Please Input Number  [1-8 or x] :  "  xvmess
echo -e ""
case $xvmess in
1)
add-grpc
;;
2)
del-grpc
;;
3)
renew-grpc
;;
4)
cek-grpc
;;
5)
add-xray
;;
6)
del-xray
;;
7)
renew-xray
;;
8)
cek-xray
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac