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
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
vmess="$(cat ~/log-install.txt | grep -w "Vmess Grpc Tls" | cut -d: -f2|sed 's/ //g')"
vless="$(cat ~/log-install.txt | grep -w "Vless Grpc Tls" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#vless$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vless.json
cat>/usr/local/etc/xray/$user-grpc.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${vmess}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "type": "gun",
      "host": "",
      "path": "GunService",
      "tls": "tls"
	  "sni": "bug.com"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-grpc.json)"
vlesslink2="vless://${uuid}@${domain}:$vless?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=bug.com#${user}"
systemctl restart xray
systemctl restart xray@vless
clear
echo -e "===[XRAY VMESS & VLESS GRPC]===="
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Ip/Host           : ${MYIP}"
echo -e "Port Vmess Grpc   : $vmess"
echo -e "Port Vless Grpc   : $vless"
echo -e "User ID           : ${uuid}"
echo -e "Encryption        : None"
echo -e "Network           : GRPC"
echo -e "ServiceName       : GunService"
echo -e "AllowInsecure     : True"
echo -e "================================"
echo -e "Link Vmess GRPC   : ${vmesslink1}"
echo -e "================================"
echo -e "Link Vless GRPC   : ${vlesslink2}"
echo -e "================================"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By Naim"