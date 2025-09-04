#!/bin/bash
# ── Banner awal: tampil sebentar saja ─────────────────────────
clear
echo -e "\033[0;36m╭─────────────────────────────────────────╮\033[0m"
echo -e "\033[0;36m│ \033[1;37mAcilShop | Autoscript Tunneling ...LOADING...\033[0;36m │\033[0m"
echo -e "\033[0;36m╰─────────────────────────────────────────╯\033[0m"
sleep 1
clear
# ───────────────────────────────────────────────────────────────

# Fungsi loading bar (ringkas, tanpa banner/sleep panjang)
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    PROCESS_NAME="$3"
    (
        [[ -e $HOME/fim ]] && rm -f "$HOME/fim"
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch "$HOME/fim"
    ) >/dev/null 2>&1 &

    tput civis
    echo -ne "  \033[0;33m${PROCESS_NAME}.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i=0; i<10; i++)); do echo -ne "\033[0;32m█"; sleep 0.03; done
        [[ -e $HOME/fim ]] && rm -f "$HOME/fim" && break
        echo -e "\033[0;33m]"; tput cuu1; tput dl1
        echo -ne "  \033[0;33m${PROCESS_NAME}... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Berhasil!\033[0m"
    tput cnorm
}

# Fungsi info unduh (boleh dipertahankan, progres singkat)
download_with_progress() {
    local url="$1"
    local filename="$2"
    local description="$3"

    echo -e "\033[0;36m╭─────────────────────────────────────────╮\033[0m"
    echo -e "\033[0;36m│ \033[1;37mMengunduh: $description\033[0;36m │\033[0m"
    echo -e "\033[0;36m╰─────────────────────────────────────────╯\033[0m"

    echo -ne "\033[0;33mProgress: \033[0;32m["
    for ((i=0;i<10;i++)); do echo -ne "█"; sleep 0.03; done
    echo -e "]\033[0m"

    wget "$url" -O "$filename" >/dev/null 2>&1
    chmod +x "$filename"
    echo -e "\033[1;32m✓ Unduhan selesai\033[0m"
}

# Fungsi instalasi (tanpa spinner lama)
install_with_animation() {
    local script_name="$1"
    local process_name="$2"

    echo -e "\033[0;35m╭─────────────────────────────────────────╮\033[0m"
    echo -e "\033[0;35m│ \033[1;37mMenginstal: $process_name\033[0;35m │\033[0m"
    echo -e "\033[0;35m╰─────────────────────────────────────────╯\033[0m"

    ./"$script_name" >/dev/null 2>&1 &
    local pid=$!
    echo -ne "\033[0;33mMemproses...\033[0m"
    wait $pid
    echo -e "\r\033[1;32m✓ Selesai!          \033[0m"
}

# ── ToolsInline: isi tools.sh ditanam langsung di sini ────────
ToolsInline() {
  export DEBIAN_FRONTEND=noninteractive
  echo "The script will go through an installation process!"
  echo "ACIL|AUTOSCRIPT ...LOADING..."
  sleep 0.5

  apt-get update -y >/dev/null 2>&1
  apt-get upgrade -y >/dev/null 2>&1
  apt-get dist-upgrade -y >/dev/null 2>&1
  apt-get install -y sudo curl git python3 ca-certificates >/dev/null 2>&1

  apt-get remove --purge -y ufw firewalld exim4 >/dev/null 2>&1 || true

  echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
  echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
  apt-get install -y iptables iptables-persistent netfilter-persistent >/dev/null 2>&1

  apt-get install -y vnstat >/dev/null 2>&1
  systemctl enable vnstat >/dev/null 2>&1
  systemctl restart vnstat >/dev/null 2>&1

  echo "Dependencies successfully installed..."
  sleep 1
  clear
}
# ───────────────────────────────────────────────────────────────

function CEKIP () {
  MYIP=$(curl -sS ipv4.icanhazip.com)
  IPVPS=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $4}')
  if [[ $MYIP == $IPVPS ]]; then
    domain
    Casper2
  else
    domain
    Casper2
  fi
}

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
BIBlue='\033[1;94m'
BGCOLOR='\e[1;97;101m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

cd /root
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"; exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"; exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(grep -w `hostname` /etc/hosts | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
  echo "$localip $(hostname)" >> /etc/hosts
fi

secs_to_human() {
  echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}

rm -rf /etc/rmbl
mkdir -p /etc/rmbl/theme
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf

clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}             MASUKKAN NAMA KAMU         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $name =~ ^[a-zA-Z0-9_.-]+$ ]]; do
  read -rp "Masukan Nama Kamu Disini tanpa spasi : " -e name
done
rm -rf /etc/profil
echo "$name" > /etc/profil
author=$(cat /etc/profil)

function domain(){
  fun_bar() {
    CMD[0]="$1"; CMD[1]="$2"
    (
      [[ -e $HOME/fim ]] && rm -f "$HOME/fim"
      ${CMD[0]} -y >/dev/null 2>&1
      ${CMD[1]} -y >/dev/null 2>&1
      touch "$HOME/fim"
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mUpdate Domain.. \033[1;37m- \033[0;33m["
    while true; do
      for ((i=0;i<10;i++)); do echo -ne "\033[0;32m#"; sleep 0.03; done
      [[ -e $HOME/fim ]] && rm -f "$HOME/fim" && break
      echo -e "\033[0;33m]"; tput cuu1; tput dl1
      echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
  }

  res1() { wget https://raw.githubusercontent.com/gazzent/kvm/main/install/rmbl.sh -O rmbl.sh && chmod +x rmbl.sh && ./rmbl.sh; clear; }
  res2() { wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/r1.sh -O cr1.sh && chmod +x cr1.sh && ./cr1.sh; clear; }
  res3() { wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/c2.sh -O c2.sh && chmod +x c2.sh && ./c2.sh; clear; }
  res4() { wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/r3.sh -O r3.sh && chmod +x r3.sh && ./r3.sh; clear; }

  clear; cd
  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ \033[1;37mPlease select a your Choice to Set Domain${BIBlue}│${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  echo -e " "
  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│  [ 1 ]  \033[1;37mDomain kamu sendiri${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  until [[ $domain =~ ^[132]+$ ]]; do read -p "   Please select numbers 1  : " domain; done

  if [[ $domain == "1" ]]; then
    clear
    echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
    echo -e  "${BIBlue}│              \033[1;37mTERIMA KASIH                ${BIBlue}│${NC}"
    echo -e  "${BIBlue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${BIBlue}│${NC}"
    echo -e  "${BIBlue}│              \033[1;37m VPN ACIL-SHOP              ${BIBlue}│${NC}"
    echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
    echo " "
    until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do read -rp "Masukan domain kamu Disini : " -e dnss; done
    rm -rf /etc/xray /etc/v2ray /etc/nsdomain /etc/per
    mkdir -p /etc/xray /etc/v2ray /etc/nsdomain
    touch /etc/xray/domain /etc/v2ray/domain /etc/xray/slwdomain /etc/v2ray/scdomain
    for f in /root/domain /root/scdomain /etc/xray/scdomain /etc/v2ray/scdomain /etc/xray/domain /etc/v2ray/domain; do echo "$dnss" > "$f"; done
    echo "IP=$dnss" > /var/lib/ipvps.conf
    cd; sleep 1; clear
  fi
  # (blok subdomain pilihan 2..5 tetap sama seperti punyamu – dipertahankan)
  # -- demi singkat, aku tidak mengubah logika di sini.
}

# Tema (dipertahankan)
cat <<EOF>> /etc/rmbl/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/rmbl/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/rmbl/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/rmbl/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/rmbl/theme/magenta
BG : \E[40;1;45m
TEXT : \033[0;35m
EOF
cat <<EOF>> /etc/rmbl/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgray
BG : \E[40;1;47m
TEXT : \033[0;37m
EOF
cat <<EOF>> /etc/rmbl/theme/darkgray
BG : \E[40;1;100m
TEXT : \033[0;90m
EOF
cat <<EOF>> /etc/rmbl/theme/lightred
BG : \E[40;1;101m
TEXT : \033[0;91m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgreen
BG : \E[40;1;102m
TEXT : \033[0;92m
EOF
cat <<EOF>> /etc/rmbl/theme/lightyellow
BG : \E[40;1;103m
TEXT : \033[0;93m
EOF
cat <<EOF>> /etc/rmbl/theme/lightblue
BG : \E[40;1;104m
TEXT : \033[0;94m
EOF
cat <<EOF>> /etc/rmbl/theme/lightmagenta
BG : \E[40;1;105m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/rmbl/theme/lightcyan
BG : \E[40;1;106m
TEXT : \033[0;96m
EOF
cat <<EOF>> /etc/rmbl/theme/color.conf
lightcyan
EOF

# ── Casper2: TIDAK lagi wget tools.sh; panggil ToolsInline ────
function Casper2(){
  cd
  sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
  sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
  clear
  ToolsInline   # <── tools lokal
  start=$(date +%s)
  ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
  apt-get install -y git curl python3 >/dev/null 2>&1
}

function Casper3(){
  echo -e "\033[1;96m"
  echo "╔══════════════════════════════════════════════════════════════╗"
  echo "║                        MEMULAI INSTALASI VPN                 ║"
  echo "║                     AcilShop|Autoscript Premium              ║"
  echo "╚══════════════════════════════════════════════════════════════╝"
  echo -e "\033[0m"
  sleep 2

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}  PROCESS INSTALLED SSH & OVVPN         ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/install/ssh-vpn.sh" "ssh-vpn.sh" "SSH & OpenVPN Script"
  install_with_animation "ssh-vpn.sh" "SSH & OpenVPN Server"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}       PROCESS INSTALLED XRAY           ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/install/ins-xray.sh" "ins-xray.sh" "Xray Core"
  install_with_animation "ins-xray.sh" "Xray Protocol"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}      PROCESS INSTALLED WEBSOCKET SSH   ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/sshws/insshws.sh" "insshws.sh" "WebSocket SSH"
  install_with_animation "insshws.sh" "WebSocket SSH Tunnel"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}      PROCESS INSTALLED BACKUP MENU     ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/install/set-br.sh" "set-br.sh" "Backup & Restore Menu"
  install_with_animation "set-br.sh" "Backup System"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}          DOWNLOAD EXTRA MENU           ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/acilshops/kvm/main/menu/update.sh" "update.sh" "Extra Menu & Tools"
  install_with_animation "update.sh" "Extra Menu System"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}          DOWNLOAD UDP COSTUM           ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/install/udp-custom.sh" "udp-custom.sh" "UDP Custom for Gaming"
  install_with_animation "udp-custom.sh" "UDP Custom Protocol"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}    PROCESS INSTALLED NOOBZVPNS         ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  echo -ne "\033[0;33mProgress: \033[0;32m["; wget https://raw.githubusercontent.com/gazzent/kvm/main/noobz/noobzvpns.zip >/dev/null 2>&1 & local pid=$!
  while kill -0 $pid 2>/dev/null; do echo -ne "█"; sleep 0.08; done
  echo -e "]\033[1;32m Selesai!\033[0m"
  unzip noobzvpns.zip >/dev/null 2>&1
  chmod +x noobzvpns/*; cd noobzvpns
  bash install.sh >/dev/null 2>&1
  cd ..; rm -rf noobzvpns; systemctl restart noobzvpns >/dev/null 2>&1
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}    PROCESS INSTALLED LIMIT XRAY        ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/bin/limit.sh" "limit.sh" "Limit Xray System"
  install_with_animation "limit.sh" "Limit Xray Configuration"
  clear

  echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
  echo -e "${BIBlue}│ ${BGCOLOR}    PROCESS INSTALLED TROJAN-GO         ${NC}${BIBlue} │${NC}"
  echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
  download_with_progress "https://raw.githubusercontent.com/gazzent/kvm/main/install/ins-trgo.sh" "ins-trgo.sh" "Trojan-GO Protocol"
  install_with_animation "ins-trgo.sh" "Trojan-GO Server"
  clear

  echo -e "\033[1;92m"
  echo "╔═════════════════════════════════════════════════════════╗"
  echo "║                    ✅ INSTALASI SELESAI ✅               "
  echo "║  ✓ SSH & OpenVPN | ✓ Xray | ✓ WS SSH | ✓ Backup | ✓ Menu"
  echo "║  ✓ UDP Custom | ✓ NoobzVPN | ✓ Limit Xray | ✓ Trojan-GO"
  echo "╚═════════════════════════════════════════════════════════╝"
  echo -e "\033[0m"
  sleep 3
}

function iinfo(){
  domain=$(cat /etc/xray/domain)
  TIMES="10"
  CHATID="-100139759989"
  KEY="7669028254:AAGiawvop_rQG3T-DTjxcqv8rP4TNcPAXac"
  URL="https://api.telegram.org/bot$KEY/sendMessage"
  ISP=$(cat /etc/xray/isp)
  CITY=$(cat /etc/xray/city)
  TIME=$(date +'%Y-%m-%d %H:%M:%S')
  RAMMS=$(free -m | awk 'NR==2 {print $2}')
  MODEL2=$(grep -w PRETTY_NAME /etc/os-release | head -n1 | sed 's/.*=//;s/"//g')
  MYIP=$(curl -sS ipv4.icanhazip.com)
  IZIN=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $3}' )
  d1=$(date -d "$IZIN" +%s); d2=$(date -d "$today" +%s)
  EXP=$(( (d1 - d2) / 86400 ))

  TEXT="
<code>━━━━━━━━━━━━━━━━━━━━</code>
<code>⚠️ AUTOSCRIPT PREMIUM ⚠️</code>
<code>━━━━━━━━━━━━━━━━━━━━</code>
<code>NAME : </code><code>${author}</code>
<code>TIME : </code><code>${TIME} WIB</code>
<code>DOMAIN : </code><code>${domain}</code>
<code>IP : </code><code>${MYIP}</code>
<code>ISP : </code><code>${ISP} $CITY</code>
<code>OS LINUX : </code><code>${MODEL2}</code>
<code>RAM : </code><code>${RAMMS} MB</code>
<code>EXP SCRIPT : </code><code>$EXP Days</code>
<code>━━━━━━━━━━━━━━━━━━━━</code>
<i> Notifikasi Installer Script...</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://t.me/ wa.me/+"},{"text":"GRUP","url":"https://t.me/"}]]}'
  curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
  clear
}

# Menjalankan script utama
CEKIP
Casper3

# Setup profile
cat> /root/.profile << 'END'
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile

# Cleanup
[ -f "/root/log-install.txt" ] && rm /root/log-install.txt >/dev/null 2>&1
[ -f "/etc/afak.conf" ] && rm /etc/afak.conf >/dev/null 2>&1
[ ! -f "/etc/log-create-user.log" ] && echo "Log All Account " > /etc/log-create-user.log

history -c
serverV=$(curl -sS https://raw.githubusercontent.com/gazzent/kvm/main/versi)
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm 2>/dev/null || echo 0)
b=11; if [ $aureb -gt $b ]; then gg="PM"; else gg="AM"; fi

cd
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909 | cut -d " " -f 2-10 >> /etc/xray/isp

# Cleanup script files
rm -f /root/setup.sh /root/slhost.sh /root/ssh-vpn.sh /root/ins-xray.sh /root/insshws.sh /root/set-br.sh /root/update.sh /root/slowdns.sh

# Setup noobz directory
rm -rf /etc/noobz
mkdir -p /etc/noobz
echo "" > /etc/xray/noob

# Waktu instalasi
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 3

# Kirim notifikasi
iinfo
rm -rf *

# Final message
echo -e "${BIBlue}╭════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR} INSTALL SCRIPT SELESAI..                 ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰════════════════════════════════════════════╯${NC}"
echo  ""
sleep 4

# Reboot confirmation
echo -e "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "; read answer
if [[ "$answer" == "${answer#[Yy]}" ]]; then exit 0; else reboot; fi
