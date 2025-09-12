#!/bin/bash
echo -ne " [INFO] Downloading File "

# Animasi spinner sambil nunggu download
spinner="/-\|"
wget -q -O update.sh "https://raw.githubusercontent.com/acilshops/kvm/main/menu/update.sh" &
pid=$!

while kill -0 $pid 2>/dev/null; do
    for i in $(seq 0 3); do
        echo -ne "\b${spinner:$i:1}"
        sleep 0.2
    done
done
wait $pid
echo -ne "\b"

echo -e "\n [INFO] Download File Successfully"
sleep 1

# Jalankan update.sh
bash update.sh

# Masuk otomatis ke menu
menu
