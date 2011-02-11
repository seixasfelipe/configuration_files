# git
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
    GIT_COLOR='\e[1;37m'
    if [[ $(parse_git_dirty) == '*' ]] ; then
        GIT_COLOR='\e[0;32m'
    fi
    GIT_BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/")
    echo $GIT_BRANCH
}



# aliases:
alias sbp="source ~/.bash_profile"



# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ -f ~/.git-completion.bash ] ; then source ~/.git-completion.bash ; fi



PS1='[\u@\h] [\[\033[0;36m\]$(rvm-prompt i v p g)\[\033[0m\]] \[\033[1;33m\]\w\[\033[0m\] $(parse_git_branch)\n\$ ' 
