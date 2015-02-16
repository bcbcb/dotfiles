# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# disable zsh autocorrect
unsetopt CORRECT

# rbenv
eval "$(rbenv init -)"

# install z
. `brew --prefix`/etc/profile.d/z.sh

# pure prompt
autoload -U promptinit && promptinit
prompt pure

# meta
alias zshconfig="subl ~/.zshrc"
alias preztoconfig="subl ~/.zpreztorc"
alias reprof='. ~/.zshrc'

# sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
sublimeText() {
  if [ $1 ]
  then
    subl $1
  else
    subl .
  fi
}
alias s=sublimeText

# z search and open in sublime
zs() {
  if [ $1 ]
  then
    z $1 && s
  fi
}

# git 
alias gs='git status '
# alias ga='git add '
# alias gb='git branch '
# alias gc='git commit '
# alias gd='git diff'
alias gco='git checkout '
# alias gk='gitk --all&'
# alias gx='gitx --all'
alias gdf='git diff --cached'
alias gcm='git commit -am '
alias ghs="git --no-pager log --color --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit"
alias gcl="git clone "
alias gpom='git push origin master'
alias gpull='git pull origin master'
alias gups='git pull upstream master'

# github
# eval "$(hub alias -s)"

# other stuff
alias cls="clear"
alias vtop="vtop --theme monokai"

# files
mkcd() {
    mkdir "$1"
    cd "$1"
}
alias mkd="mkcd"

touchs() {
    touch "$1"
    subl "$1"
}

alias cd..="cd .."


#open directory or file in finder
dirOrFile() {
  if [ $1 ]
  then open $1
  else
    open .
  fi
}
alias o="dirOrFile"

ltree()
{
    tree -C $* | less -R
}
alias ls="ls -GFh"
alias lsa="ls -a"

# clone repo, cd into it, open in sublime
clone() {
  url=$1
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//')
  git clone $url $reponame
  cd $reponame
  subl .
}

# hack reactor
alias hr='cd ~/projects/hr && ls'
alias hrc='open http://bookstrap.hackreactor.com/curriculum/curriculum'
alias hra='open http://bookstrap.hackreactor.com/attendance'
alias gcal='open https://www.google.com/calendar'
alias spec='open SpecRunner.html'
alias html="open *.html"

toy() {
  cd ~/projects/hr/2014-12-toy-problems
  git pull --no-edit upstream master
  subl .
}
alias toypr="open https://github.com/bcbcb/2014-12-toy-problems/compare/hackreactor:bcbcb...bcbcb:master"
alias toys="cd ~/projects/hr/2014-12-toy-problems && subl ."
