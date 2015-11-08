alias l='ls -trlah'
alias ..='cd ..'
alias ...='.. && ..'
alias ....='... && ..'
alias .....='.... && ..'
alias ......='..... && ..'
alias .......='...... && ..'
alias ........='....... && ..'

export LANG="zh_CN.utf8"
export LC_ALL="zh_CN.utf8"
ip=`/sbin/ifconfig eth1|grep "inet addr:"|cut -d: -f 2|cut -d" " -f1`
export PS1="\[\e[31;1m\]\u\[\e[0m\]@\[\e[32;1m\]$ip\[\e[0m\]:\[\e[35;1m\]\w\[\e[0m\]$ "
stty erase ^H
