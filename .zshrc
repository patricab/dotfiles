# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
. /usr/share/autojump/autojump.sh

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## User functions
gsh() {
	eval $(ssh-agent -s)
	ssh-add $1
}

rec() {
	asciinema rec $1
	asciicast2gif -t solarized-dark $1 $1.gif
}

cls() { 
	local HISTSIZE=0;
	clear
}

# Random aliases
alias popd='popd -n'
alias term='i3-sensible-terminal'
alias python='python3.7'
alias update='sudo apt -y update --allow-unauthenticated; sudo apt -y upgrade --allow-unauthenticated'
alias activate='source env/bin/activate'
#alias gc='google-chrome --force-device-scale-factor=1.4'
alias ltc='wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'
alias gcn='google-chrome --incognito --force-device-scale-factor=1.4'
#alias cls='history -c && history -w; clear'
alias ds='dirs -v' 
alias gl='git ls-tree -r master --name-only'
alias gu='git remote update origin --prune'
alias spec='screenfetch'
alias ga='git add'
alias gaa='git add --all'
alias gps='git push'
alias gp='git pull'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias gu='git remote update origin --prune'
alias gsp='git pull --recurse-submodules'
alias gsc='git clone --recurse-submodules'
alias gst='git stash'
alias gr='git reset'
alias vivado='/home/pab/Documents/Vivado/2020.1/bin/vivado'
alias vpnc='/home/pab/Documents/anyconnect-linux64-4.8.01090/vpn/vpn connect vpn.ntnu.no'
alias vpnd='/home/pab/Documents/anyconnect-linux64-4.8.01090/vpn/vpn disconnect'
alias readme='npx readme-md-generator'
alias gh-project='cookiecutter gh:dec0dOS/amazing-github-template'

# PATHs
export PATH=$PATH:/usr/local/go/bin
export PATH=/usr/local/lib/nodejs/node-v16.13.2-linux-x64/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
#export PATH=/home/pab/Documents/Unity/auto:$PATH
#export GOPATH=/home/pab/.go
