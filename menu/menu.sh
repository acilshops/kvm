#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl -sS ipv4.icanhazip.com)
ipsaya=$(curl -sS ipv4.icanhazip.com)
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
Isadmin=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $5}')
Exp2=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'
Name=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $2}')
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/acilshops/ip/main/ip"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
systemctl stop nginx
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│${NC}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  $COLOR1│"
echo -e "$COLOR1│   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned ${NC}      $COLOR1│"
echo -e "$COLOR1│     ${yl}Buy access permissions for scripts${NC}          $COLOR1│"
echo -e "$COLOR1│             \033[0;32mContact t.me/AcilOffcial{NC}                 $COLOR1│"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
fi
}
madmin=$(curl -sS https://raw.githubusercontent.com/acilshops/ip/main/ip | grep $MYIP | awk '{print $5}')
checking_sc
cd
if [ ! -e /etc/per/id ]; then
mkdir -p /etc/per
echo "" > /etc/per/id
echo "" > /etc/per/token
elif [ ! -e /etc/perlogin/id ]; then
mkdir -p /etc/perlogin
echo "" > /etc/perlogin/id
echo "" > /etc/perlogin/token
elif [ ! -e /usr/bin/id ]; then
echo "" > /usr/bin/idchat
echo "" > /usr/bin/token
fi
if [ ! -e /etc/xray/ssh ]; then
echo "" > /etc/xray/ssh
elif [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
elif [ ! -e /etc/xray/sshx/listlock ]; then
echo "" > /etc/xray/sshx/listlock
elif [ ! -e /etc/vmess ]; then
mkdir -p /etc/vmess
elif [ ! -e /etc/vmess/listlock ]; then
echo "" > /etc/vmess/listlock
elif [ ! -e /etc/vless ]; then
mkdir -p /etc/vless
elif [ ! -e /etc/vless/listlock ]; then
echo "" > /etc/vless/listlock
elif [ ! -e /etc/trojan ]; then
mkdir -p /etc/trojan
elif [ ! -e /etc/trojan/listlock ]; then
echo "" > /etc/trojan/listlock
elif [ ! -e /etc/xray/noob ]; then
echo "" > /etc/xray/noob
elif [ ! -e /etc/trojan-go/trgo ]; then
echo "" > /etc/trojan-go/trgo
fi
clear
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/etc/t1
bulan=$(date +%b)
tahun=$(date +%y)
ba=$(curl -s https://pastebin.com/raw/0gWiX6hE)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /etc/t1)" != '0' ]; then
bulan=$(date +%b)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $9}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $10}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $3}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $4}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $6}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $7}')
else
bulan2=$(date +%Y-%m)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $8}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $9}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $2}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $3}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $5}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /etc/t1)" != '0' ]; then
yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
yesterday=NULL
yesterday_v=NULL
yesterday_rx=NULL
yesterday_rxv=NULL
yesterday_tx=NULL
yesterday_txv=NULL
fi
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
status_ws="${Green_font_prefix}ON${NC}"
else
status_ws="${RED}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${Green_font_prefix}ON${NC}"
else
status_nginx="${Red_font_prefix}OFF${NC}"
systemctl start nginx
fi
if [[ -e /usr/bin/kyt ]]; then
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
echo -ne
else
systemctl start kyt
fi
fi
rm -rf /etc/status
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
status_xray="${Green_font_prefix}ON${NC}"
else
status_xray="${Red_font_prefix}OFF${NC}"
fi

stat_noobz=$( systemctl status noobzvpns | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stat_noobz == "running" ]]; then
    stat_noobz="${Green_font_prefix}ON${NC}"
else
    stat_noobz="${Red_font_prefix}OFF${NC}"
    systemctl start noobzvpns
fi

# // Dropbear
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $dropbear_status == "running" ]]; then
   status_beruangjatuh="${Green_font_prefix}ON${NC}"
else
   status_beruangjatuh="${Red_font_prefix}OFF${NC}"
fi

udp_custom=$( systemctl status udp-custom | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $udp_custom == "running" ]]; then
    status_udp="${Green_font_prefix}ON${NC}"
else
    status_udp="${Red_font_prefix}OFF${NC}"
    systemctl start udp-custom
fi

stat_trgo=$( systemctl status trojan-go | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stat_trgo == "running" ]]; then
    stat_trgo="${Green_font_prefix}ON${NC}"
else
    stat_trgo="${Red_font_prefix}OFF${NC}"
    systemctl start trojan-go
fi



# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}Active${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
# TOTAL CREATE ACC VMESS
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL CREATE ACC VLESS
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL CREATE ACC TROJAN
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
# TOTAL CREATE ACC SSH
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
# TOTAL CREATE ACC NOOBZ
jumlah_noobz=$(grep -c -E "^### " "/etc/xray/noob")
# TOTAL CREATE ACC TROJAN-GO
jumlah_trgo=$(grep -c -E "^### " "/etc/trojan-go/trgo")
function m-ip2(){
clear
cd
if [[ -e /etc/github/api ]]; then
m-ip
else
mkdir /etc/github
echo "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" > /etc/github/api
echo "imanfals51@gmail.com" > /etc/github/email
echo "AngIMAN" > /etc/github/username
m-ip
fi
}
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
if [ "$Isadmin" = "ON" ]; then
uis="${COLOR1}Premium ADMIN VIP$NC"
else
uis="${COLOR1}Premium Version$NC"
fi
function m-bot2(){
clear
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  ${WH} MENU TELEGRAM BOT NOTIFIKASI         ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
echo ""
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  [ 1 ] ${WH}BOT NOTIF TRANSAKSI & MULTI LOGIN ACCOUNT PREMIUM${NC}"
echo -e "$COLOR1  [ 2 ] ${WH}BOT NOTIF CREATE ACCOUNT & LAINNYA${NC}"
echo -e "$COLOR1  [ 3 ] ${WH}BOT NOTIF AUTO BACKUP    ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
echo -e " "
read -p "   Please select numbers 1-3  : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -rf /etc/perlogin
mkdir -p /etc/perlogin
cd /etc/perlogin
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Multi Login"
read -rp "Enter Token (Creat on @BotFather) : " -e token2
echo "$token2" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat
echo "$idat" > id
sleep 1
m-bot2
fi
if [[ $bot == "2" ]]; then
clear
rm -rf /etc/per
mkdir -p /etc/per
cd /etc/per
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Akun Dan Lain Lain"
read -rp "Enter Token (Creat on @BotFather) : " -e token3
echo "$token3" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat2
echo "$idat2" > id
sleep 1
m-bot2
fi
if [[ $bot == "3" ]]; then
clear
rm -rf /usr/bin/token
rm -rf /usr/bin/idchat
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Backup Telegram"
read -rp "Enter Token (Creat on @BotFather) : " -e token23
echo "$token23" > /usr/bin/token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idchat
echo "$idchat" > /usr/bin/idchat
sleep 1
m-bot2
fi
menu
}
clear
clear && clear && clear
# --- Mulai Skrip Menu (Versi Dinamis & Rapi) ---
clear

# Variabel Warna (diasumsikan sudah ada dari skrip Anda)
GR="\e[32m"
WH="\e[37m"
YL="\e[33m"
NC="\e[0m"

# Mendapatkan lebar terminal saat ini
WIDTH=$(tput cols)

# --- FUNGSI UNTUK PERATAAN DINAMIS ---
# Fungsi ini akan menempatkan teks di tengah layar secara otomatis
center_text() {
    local text="$1"
    # Menghapus kode warna agar perhitungan panjang karakter akurat
    local visible_text=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local text_len=${#visible_text}
    local padding=$(((WIDTH - text_len) / 2))
    # Pastikan padding tidak negatif jika teks terlalu panjang
    ((padding < 0)) && padding=0
    printf "%*s%s\n" "$padding" "" "$text"
}

# Fungsi untuk membuat garis pemisah dengan panjang dinamis
print_line() {
    local char="$1"
    printf "%*s\n" "$WIDTH" "" | tr ' ' "$char"
}

# --- Mulai Tampilan Menu ---

# --- Header ---
center_text "${GR}═══════════════════•${WH} AcilShop | Autoscript Premium ${GR}•═══════════════════${NC}"
echo ""

# --- Info Server ---
center_text "${GR}══════════════════════════════════════════════${NC}"
# Menggabungkan variabel untuk ditampilkan
ram_info="$uram MB / $tram MB"
lokasi_info="$ISP - $CITY"
domain_info=$(cat /etc/xray/domain)
# Membuat blok info, lalu menempatkannya di tengah
# Kita gunakan printf untuk meratakan titik dua (:) di dalam blok
server_info=$(cat <<EOF
${WH}OS          : ${YL}$MODEL2
${WH}IP/Domain   : ${YL}$MYIP / $domain_info
${WH}CPU/RAM     : ${YL}$cpu_usage / $ram_info
${WH}Lokasi      : ${YL}$lokasi_info
EOF
)
# Mencetak blok server_info baris per baris dengan perataan tengah
while IFS= read -r line; do
    center_text "$line"
done <<< "$server_info"
center_text "${GR}══════════════════════════════════════════════${NC}"
echo ""

# --- Info Client ---
center_text "${GR}╭──────────────────────────────────╮${NC}"
center_text "${GR}│   ${WH}Client: ${YL}$author ${WH}| Version: ${YL}V3.12   ${GR}│${WH}Dev:AcilShop${NC}"
center_text "${GR}╰──────────────────────────────────╯${NC}"
echo ""

# --- Statistik Penggunaan ---
center_text "${GR}══════════════════════• ${WH}Bandwidth usage/total Account${GR} •══════════════════${NC}"
# Membuat blok statistik, lalu menempatkannya di tengah
stats_info=$(cat <<EOF
${WH}Bandwidth Hari Ini  : ${YL}$today_tx $today_txv
${WH}Bandwidth Kemarin   : ${YL}$yesterday_tx $yesterday_txv
${WH}Bandwidth Bulan Ini : ${YL}$month_tx $month_txv
EOF
)
while IFS= read -r line; do
    center_text "$line"
done <<< "$stats_info"
center_text "${YL}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
account_info=$(printf "${WH}SSH: ${YL}%-2s  ${WH}VMESS: ${YL}%-2s  ${WH}VLESS: ${YL}%-2s  ${WH}TROJAN: ${YL}%-2s  ${WH}TRGO: ${YL}%-2s" "$total_ssh" "$vmess" "$vless" "$trtls" "$jumlah_trgo")
center_text "$account_info"
center_text "${GR}══════════════════════════════════════════════${NC}"
echo ""

# --- Status Layanan ---
cek_status() {
    # Menggunakan systemctl untuk mengecek status layanan
    if [[ $(systemctl is-active "$1") == "active" ]]; then
        echo -e "${GR}ON${NC}"
    else
        echo -e "\e[31mOFF${NC}" # Merah untuk OFF
    fi
}
# Anda mungkin perlu menyesuaikan nama layanan di bawah ini (misal: sshd, nginx, xray, dll)
status_line="${WH}[XRAY:${NC}$(cek_status xray)${WH}] [NGINX:${NC}$(cek_status nginx)${WH}] [SSH:${NC}$(cek_status sshd)${WH}]"
center_text "$status_line"
echo ""

# --- Menu Utama ---
center_text "${GR}═══════════════════════════• ${WH}MENU UTAMA ${GR}•═════════════════════════════${NC}"
echo ""
center_text "${GR}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
# Membuat menu dengan printf untuk perataan kolom yang sempurna
menu_line_1=$(printf "${GR}[${WH} 1${GR}]${NC} %-24s ${GR}[${WH} 8${GR}]${NC} %-s" "SSH & OpenVPN" "Cek Layanan Aktif")
menu_line_2=$(printf "${GR}[${WH} 2${GR}]${NC} %-24s ${GR}[${WH} 9${GR}]${NC} %-s" "Vmess" "Restart Layanan")
menu_line_3=$(printf "${GR}[${WH} 3${GR}]${NC} %-24s ${GR}[${WH}10${GR}]${NC} %-s" "Vless" "Menu Sistem")
menu_line_4=$(printf "${GR}[${WH} 4${GR}]${NC} %-24s ${GR}[${WH}11${GR}]${NC} %-s" "Trojan" "Panel Bot Telegram")
menu_line_5=$(printf "${GR}[${WH} 5${GR}]${NC} %-24s ${GR}[${WH}12${GR}]${NC} %-s" "NoobzVPN" "Notifikasi Bot Telegram")
menu_line_6=$(printf "${GR}[${WH} 6${GR}]${NC} %-24s ${GR}[${WH}13${GR}]${NC} %-s" "Trojan-Go" "Backup & Restore")
menu_line_7=$(printf "${GR}[${WH} 7${GR}]${NC} %-24s ${GR}[${WH}14${GR}]${NC} %-s" "Hapus Akun Kadaluarsa" "Menu Rebuild")
menu_line_8=$(printf "${GR}[${WH}15${GR}]${NC} %-s" "Update Script")
center_text "$menu_line_1"
center_text "$menu_line_2"
center_text "$menu_line_3"
center_text "$menu_line_4"
center_text "$menu_line_5"
center_text "$menu_line_6"
center_text "$menu_line_7"
center_text "$menu_line_8"
center_text "${GR}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# --- Panel Admin (jika aktif) ---
if [ "$Isadmin" = "ON" ]; then
  center_text "${GR}═══════════════════════════• ${WH}PANEL ADMIN ${GR}•═════════════════════════════${NC}"
  echo ""
  admin_menu=$(printf "${GR}[${WH}16${GR}]${NC} %-s" "Menu Reseller IP")
  center_text "$admin_menu"
  ressee="m-ip2"
  bottt="m-bot"
  echo ""
fi

# --- Footer ---
print_line "${GR}═${NC}"
# Memanggil fungsi datediff (diasumsikan sudah ada)
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo "$(( (d1 - d2) / 86400 )) Hari"
}
center_text "${WH}Script Aktif Hingga: ${YL}$Exp2${NC} (${WH}$(datediff "$Exp2" "$DATE")${NC}) ${YL}$sts${NC}"
center_text "${WH}Credit:${YL}@AcilOffcial${NC}"
center_text "${WH}Ketik ${GR}[${WH}0${GR}]${NC} atau tekan ${WH}CTRL+C${NC} untuk keluar."
print_line "${GR}═${NC}"
function new(){
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 1
menu
}
function newx(){
clear
until [[ $usagee =~ ^[0-9]+$ ]]; do
read -p "kuota user format angka 1, 2 atau 3 (TERA): " usagee
done
echo "$usagee" > /etc/usagee
cat> /etc/cron.d/bantwidth << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/bin/bantwidth
END
echo "Auto-Shutdown $usagee TERA TURN ON."
sleep 1
menu
}
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
domain=$(cat /etc/xray/domain)
function restartservice(){    
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    systemctl restart nginx
    systemctl restart trojan-go
    systemctl restart xray
    systemctl restart noobzvpns
    systemctl restart daemon
    systemctl restart udp-custom
    systemctl restart ws-dropbear
    systemctl restart ws-stunnel
    systemctl restart openvpn
    systemctl restart cron
    systemctl restart netfilter-persistent
    systemctl restart squid
    systemctl restart badvpn1
    systemctl restart badvpn2
    systemctl restart badvpn3
    systemctl restart client
    systemctl restart server
}
clear
echo -e "$COLOR1 ╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG2}          ${WH}RESTART SERVICE VPS             ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ╰══════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "  \033[1;91m Restart All Service... \033[1;37m"
fun_bar 'res1'

echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
}
function updatews(){
cd
rm -rf *
wget https://satantech.serv00.net/arthepat/menu/install-up.sh &> /dev/null
chmod +x install_up.sh
./install_up.sh
}
echo -e ""
echo -ne " ${WH}Select Menu 1-15 ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-trojan ;;
05 | 5) clear ; m-noobz ;;
06 | 6) clear ; m-trgo ;;
07 | 7) clear ; bash /usr/bin/ex.sh ;;
08 | 8) clear ; running ;;
09 | 9) clear ; restartservice ;;
10 | 10) clear ; m-system ;;
11 | 11) clear ; m-bot ;;
12 | 12) clear ; m-bot2 ;;
13 | 13) clear ; m-backup ;;
14 | 14) clear ; m-rebuild ;;
15 | 15) clear ; m-update ;;
#88 | 88) clear ; new ;;
77 | 77) clear ; newx ;;
99 | 99) clear ; passwd ;;
esac
