#!/bin/bash
s1="Off"
s2="Off"
s3="Off"
s4="Off"
s5="Off"
clear

function MAIN() {
    clear
    echo "patricab Automatic Config Script"
    echo "======================"
    echo "1) Pacman-packages: $s1"
    echo "2) Hardlink config files: $s2"
    echo "3) Vim plugins: $s3"
    echo "4) Git setup: $s4"
    echo "5) Yay setup: $s5"
    echo "----------------------"
    echo "i) Install "
    echo "a) All"
    echo "r) Reset"
    echo "q) Quit"
    echo "======================"
    read -p "> " ans

    case $ans in
        1) s1="On"; FUNCTION[0]="PACMAN"; MAIN ;;
        2) s2="On"; FUNCTION[1]="HARDLINK"; MAIN ;;
        3) s3="On"; FUNCTION[2]="GIT"; MAIN ;;
        4) s4="On"; FUNCTION[3]="VIM"; MAIN ;;
        5) s5="On"; FUNCTION[4]="YAY"; MAIN ;;

        [iI])
            for i in "${!FUNCTION[@]}";
            do
                ${FUNCTION[$i]}
            done
            ;;
        [aA])
            s1="On"
            s2="On"
            s3="On"
            s4="On"
            s5="On"
            FUNCTION=("PACMAN" "HARDLINK" "GIT" "VIM" "YAY")

            clear
            MAIN
            ;;
        [rR])
            s1="Off"
            s2="Off"
            s3="Off"
            s4="Off"
            s5="Off"
	    unset FUNCTION

            clear
            MAIN
            ;;

        q) exit ;;
        *) MAIN ;;
    esac
}

function PACMAN() {
    # Install packages
    sudo pacman-mirrors -f5 && sudo pacman -Syu
    sudo pacman -S --needed --noconfirm - < packages
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
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    #nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

function HARDLINK() {
    # Config files
    git submodule update --init
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # ln -f .conf .config/i3/config # Adds hardlink between custom i3 config and i3/config
    ln -s $(pwd)/zshrc ~/.zshrc
    ln -s $(pwd)/nvim ~/.config/nvim
    ln -s $(pwd)/tmux ~/.config/tmux
    ln -s $(pwd)/tmux.conf ~/.tmux.conf
    ln -s $(pwd)/zshrc ~/.zshrc
    ln -s $(pwd)/oh-my-zsh ~/.oh-my-zsh
    ln -s $(pwd)/gitconfig ~/.gitconfig
    ln -s $(pwd)/gdbinit ~/.gdbinit
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
    yay -S --needed --noconfirm - < yay
}

if [[ $1 == -d ]]
then
    FUNCTION=("PACMAN" "HARDLINK" "GIT" "VIM" "YAY")
    for i in "${!FUNCTION[@]}";
    do
        ${FUNCTION[$i]}
    done
    exit
fi

MAIN
