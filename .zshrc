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

# iTerm colors
iterm_bgcolor(){
  local R=$1
  local G=$2
  local B=$3
  /usr/bin/osascript <<EOF
tell application "iTerm"
  tell the current terminal
    tell the current session
      set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
    end tell
  end tell
end tell
EOF
}

iterm_tabcolor() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

iterm_resetcolor() {
  echo -ne "\033]6;1;bg;*;default\a"
}


# sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

s(){ subl ${1:-.} }
# o(){ open ${1:-.} }

zs() {
  if [ $1 ]
  then
    z $1 && subl .
  fi
}

# git 
alias gs='git status '
alias gco='git checkout '

# alias ga='git add '
# alias gb='git branch '
# alias gd='git diff'
alias gco='git checkout '
# alias gk='gitk --all&'
# alias gx='gitx --all'
alias gdf='git diff --cached'
alias gcm='git commit -am '
alias gcl="git clone "
alias gpom='git push origin master'
alias gpog='git push origin gh-pages'
alias gprum='git pull --rebase upstream master'

alias glog="git --no-pager log --color --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit"

ghs() {
  if [ $1 ]
    then
    glog -n $1
  else
    glog
  fi
}

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
  iterm_bgcolor 10 30 30
  iterm_tabcolor 200 256 256
  cd ~/projects/hr/2014-12-toy-problems
  git pull --no-edit upstream master
  subl $(git diff --name-only HEAD~1)
}

GITUSERNAME="bcbcb"
alias toypr="open https://github.com/$GITUSERNAME/2014-12-toy-problems/compare/hackreactor:$GITUSERNAME...$GITUSERNAME:master"
alias toys="cd ~/projects/hr/2014-12-toy-problems && subl ."

# typos
alias gul='gulp'

# open github repo 
alias hb='hub browse'

alias g="gulp"
alias gprup="git pull --rebase upstream master"
