alias popd='popd -n'
alias update='sudo apt -y update --allow-unauthenticated; sudo apt -y upgrade --allow-unauthenticated;'
alias activate='source env/bin/activate'
alias src='source ~/ncs/v1.5.0/zephyr/zephyr-env.sh'
alias cls='history -c && history -w; clear'
alias ds='dirs -v' 
alias gl='git ls-tree -r master --name-only'
alias spec='screenfetch'
alias gps='git push'
alias gp='git pull'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'

source ~/.git-completion.bash

