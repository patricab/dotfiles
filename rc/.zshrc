# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
#. /usr/share/autojump/autojump.sh
 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git gh autojump fzf zsh-autosuggestions colored-man-pages web-search)
plugins=(git gh autojump fzf colored-man-pages web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## User functions
# Git shell: hotfix for ssh key errors on WSL. 
# Arg: ssh _id_ file path
unalias gsh
gsh() {
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/$1
}

# Git fetch: fetch updates for specific branch
# Arg: target branch
unalias gf
gf() {
	git fetch origin $1:$1
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
alias update='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias activate='source env/bin/activate'
#alias gc='google-chrome --force-device-scale-factor=1.4'
alias ltc='wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'
alias gcn='google-chrome --incognito --force-device-scale-factor=1.4'
alias ds='dirs -v' 
alias gl='git ls-tree -r master --name-only'
alias gu='git remote update origin --prune'
alias spec='screenfetch'
alias ga='git add -u'
alias gaa='git add --all'
alias gps='git push && git push --tags'
alias gp='git pull'
alias gs='git status -uno'
alias gc='git checkout'
alias gb='git branch'
alias gu='git remote update origin --prune'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD) && git push --tags'
alias gsp='git pull --recurse-submodules'
alias gsc='git clone --recurse-submodules'
alias gsi='git submodule update --init'
alias gst='git stash'
alias gr='git reset'
alias ggu='git remote get-url origin'
alias vivado='/home/pab/Documents/Vivado/2020.1/bin/vivado'
alias vpnc='/home/pab/Documents/anyconnect-linux64-4.8.01090/vpn/vpn connect vpn.ntnu.no'
alias vpnd='/home/pab/Documents/anyconnect-linux64-4.8.01090/vpn/vpn disconnect'
alias readme='npx readme-md-generator'
alias gh-project='cookiecutter gh:dec0dOS/amazing-github-template'
alias pacman='sudo pacman'
alias nv="nvim"
alias docker="sudo docker"
alias oss-cad='source ~/tools/oss-cad-suite/environment'

# PATHs
export PATH=$PATH:/usr/local/go/bin
# export PATH=/home/patricab/Documents/oss-cad-suite/bin:$PATH
export PATH=/usr/local/lib/nodejs/node-v16.13.2-linux-x64/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=$PATH:$ZSH
#export PATH=/home/pab/Documents/Unity/auto:$PATH
#export GOPATH=/home/pab/.go
#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh

# Configs
export EDITOR=/usr/bin/nvim
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
bindkey '^[^M' autosuggest-execute
bindkey '^[^J' autosuggest-execute

if [ -e /home/patricab/.nix-profile/etc/profile.d/nix.sh ]; then . /home/patricab/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer