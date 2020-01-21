#!/bin/bash
s1="On"
s2="On"
s3="On"
s4="On"
s5="On"
s6="On"
s7="On"
s8="On"
s9="On"
sv="On"
clear

function MAIN() {
clear
echo "patricab Automatic Config Script"
echo "======================"
echo "1) Apt-packages: $s1"
echo "2) Pentest packages: $s2"
echo "3) Vim plugins: $s3"
echo "4) Hardlink config files: $s4"
echo "5) Git setup: $s4"
echo "6) Upgrade system and reboot: $s4"
echo "v) Verbose mode: $sv"
echo "=== Specific programs ==="
echo "7) Mailspring: $s4"
echo "8) Nordvpn: $s5"
echo "9) Dropbox: $s6"
echo "----------------------"
echo "i) Install "
echo "r) Reset"
echo "q) Quit"
echo "======================"
read -p "> " ans

case $ans in
1) s1="On"; script="$script -sP"; MAIN ;;
2) s2="On"; script="$script -sV"; MAIN ;;
3) s3="On"; script="$script -O"; MAIN ;;
4) s4="On"; script="$script -sA"; MAIN ;;
5) s5="On"; script="$script -PN"; MAIN ;;
6) s6="On"; script="$script --open"; MAIN ;;
[vV]) v="On"; script="$script -v"; MAIN ;;
[iI])
    script="$script $ip"
    clear
    $script
    sleep 10
    s1="Off"
    s2="Off"
    s3="Off"
    s4="Off"
    s5="Off"
    s6="Off"
    sv="Off"
    sh="/root"
    script="nmap"
    path="Off"
    port=""
    ip=""
    MAIN
    ;;
[rR])
    s1="Off"
    s2="Off"
    s3="Off"
    s4="Off"
    s5="Off"
    s6="Off"
    sv="Off"
    sh="/root"
    script="nmap"
    path="Off"
    port=""
    ip=""
    clear
    MAIN
    ;;
q) exit ;;
*) MAIN ;;
esac
}
MAIN
