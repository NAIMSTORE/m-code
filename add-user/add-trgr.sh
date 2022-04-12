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
uuid=$(cat /proc/sys/kernel/random/uuid)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
clear
xtr="$(cat ~/log-install.txt | grep -w "Trojan Grpc Tls" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/akunxtrgrpc.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days) : " masaaktif
harini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xtrojan$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/xtrojan.json
echo -e "### $user $exp $harini $uuid" >> /usr/local/etc/xray/akunxtrgrpc.conf
systemctl restart xray@xtrojan
trojanlink="trojan://${user}@${sts}${domain}:$xtr/?security=tls&type=grpc&serviceName=GunService&sni=$sni#${user}"
clear
echo -e ""
echo -e "=======[XRAY TROJAN GRPC]======="
echo -e "Remarks         : ${user}"
echo -e "Domain          : ${domain}"
echo -e "IP/Host         : ${MYIP}"
echo -e "Port            : ${xtr}"
echo -e "Key             : ${user}"
echo -e "Network         : TCP"
echo -e "serviceName     : GunService"
echo -e "AllowInsecure   : True"
echo -e "================================"
echo -e "Link Trojan Grpc  : ${trojanlink}"
echo -e "================================"
echo -e "Created    : $harini"
echo -e "Expired    : $exp"
echo -e "Script By Naim"
