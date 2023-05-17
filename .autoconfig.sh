#!/bin/bash
s1="On"
s2="On"
s3="On"
s4="On"
s5="On"
clear

# FUNCTION=("PACMAN" "PENTEST" "VIM" "HARDLINK" "GIT" "EMACS" "NORDVPN" "DROPBOX" "UPGRADE")
FUNCTION=("PACMAN" "VIM" "HARDLINK" "GIT" "YAY")

if [ $1 == -d ] || [ $1 == --default ];
then
    pacman -Sy
    for i in "${!FUNCTION[@]}";
    do
        ${FUNCTION[$i]}
    done
fi

function MAIN() {
    clear
    echo "patricab Automatic Config Script"
    echo "======================"
    echo "1) Pacman-packages: $s1"
    echo "2) Vim plugins: $s2"
    echo "3) Hardlink config files: $s4"
    echo "4) Git setup: $s5"
    echo "5) Yay setup: $s6"
    echo "----------------------"
    echo "i) Install "
    echo "r) Reset"
    echo "q) Quit"
    echo "======================"
    read -p "> " ans

    case $ans in
        1) s1="Off"; unset FUNCTION[0]; MAIN ;;
        2) s2="Off"; unset FUNCTION[1]; MAIN ;;
        3) s3="Off"; unset FUNCTION[2]; MAIN ;;
        4) s4="Off"; unset FUNCTION[3]; MAIN ;;
        5) s5="Off"; unset FUNCTION[4]; MAIN ;;

        [iI])
            sudo apt-get -y update
            for i in "${!FUNCTION[@]}";
            do
                ${FUNCTION[$i]}
            done
            ;;
        [rR])
            s1="On"
            s2="On"
            s3="On"
            s4="On"
            s5="On"
            clear
            MAIN
            ;;
        q) exit ;;
        *) MAIN ;;
    esac
}

function PACMAN() {
    # Install packages
    sudo pacman -Syu
    sudo pacman -S --needed --noconfirm cmake wine wireshark vim python3 dos2unix nmap tmux netcat tcpdump hping3 ranger zathura \
    feh git screenfetch nodejs zsh github-cli vlc base-devel obsidian make patch autojump htop docker docker-compose neovim vlc mesa \
    ripgrep fzf
}

# function PENTEST() {
#     # Installing se-toolkit
#     sudo mkdir /pentest
#     cd /pentest
#     sudo git clone https://github.com/trustedsec/social-engineer-toolkit.git
#     cd social-engineer-toolkit/
#     sudo python setup.py install
# }

function VIM() {
    # Vim plugins
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

function HARDLINK() {
    # Config files
    cd ~
    ln -f .conf .config/i3/config # Adds hardlink between custom i3 config and i3/config
}

function GIT() {
    # Git setup
    git config --global core.editor "nvim"
    git config --global user.name "patricab"
    git config --global user.email "patric.berthelsen@gmail.com"
}

# function EMACS() {
#     # Emacs - Text editor
#     cd ~
#     sudo add-apt-repository ppa:kelleyk/emacs
#     sudo apt -y install emacs26
#     git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# }

# function NORDVPN() {
#     # Nordvpn
#     cd ~
#     wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
#     sudo apt -y install nordvpn-release_1.0.0_all.deb
#     rm nordvpn-release_1.0.0_all.deb
# }

function YAY() {
    # Dropbox
    yay -S dropbox slack-desktop
}

MAIN
