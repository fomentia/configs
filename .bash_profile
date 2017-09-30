###### Colors ######

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

##### Git Color ####

function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    fi
}

#### Git Branch ####

function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch)"
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit)"
    fi
}

## Git Completion ##

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

####### PATH #######

PATH="$HOME/Library/Python/3.4/bin:/usr/local/bin:/usr/local/heroku/bin:$HOME/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.4/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin:$MAGICK_HOME/bin:${PATH}"
export PATH

###### Prompt ######

# PS1="\[$(tput setaf 2)\]\[$(tput bold)\][\u]\[$(tput sgr0)\]"  >> Include if you want to display username
PS1="\[$(tput setaf 6)\]\W \[$(tput sgr0)\]" # Base working directory
PS1+="\[\$(git_color)\]" # Git color
PS1+="\$(git_branch) " # Git branch
PS1+="\[$(tput setaf 6)\]$\[$(tput sgr0)\] " # Prompt

export PS1

# Environment Vars #

STRIPE_PUBLISHABLE_KEY="pk_test_1E89hNXMZYx4QpJPN297vKur"
STRIPE_SECRET_KEY="sk_test_O45ZJPhrp5PwTMY1dca9OGgL"
CONSTANT_CONTACT_API_KEY="f5eds6e724zruxyebc28updm"
CONSTANT_CONTACT_OAUTH_TOKEN="041108d6-e79e-4541-bb20-95dd4c3e9e9e"
DEVISE_SECRET_KEY="c2ae6e9540cc2640e7b55c82382ab76cb809122ad8397825a7dbc9000f303ce6da89bdfabdba779b4c159a239ec77ce6af55151d854e91f3f8dd63515867f9a9"
WFTH_PERMISSIONS_AWS_ACCESS_KEY="AKIAINAP7D7O45IBDRIA"
WFTH_PERMISSIONS_AWS_ACCESS_SECRET="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"
WFTH_PERMISSIONS_JWPLAYER_LICENSE_KEY="SZSxh+F01tVWCH6Xkg3BkjqTuxz0xUbxWSIrJQ=="
DEV_SECRET_KEY_BASE="bbc538b1b8c22dd1c056e8df260ec6b8fb584b9e20dd73da626d267b974d9506531846b7f26e0bcfef877b2c3690cfd36e40feaf72834df6355626c1483906d9"

export STRIPE_PUBLISHABLE_KEY
export STRIPE_SECRET_KEY
export CONSTANT_CONTACT_API_KEY
export CONSTANT_CONTACT_OAUTH_TOKEN
export DEVISE_SECRET_KEY
export WFTH_PERMISSIONS_AWS_ACCESS_KEY
export WFTH_PERMISSIONS_AWS_ACCESS_SECRET
export WFTH_PERMISSIONS_JWPLAYER_LICENSE_KEY
export DEV_SECRET_KEY_BASE

export JAVA_HOME=$(/usr/libexec/java_home)
export VISUAL=emacsclient
export EDITOR="$VISUAL"

###### Aliases #####
alias swift='xcrun swift'
alias macvim="open -a MacVim"
alias weather="curl http://wttr.in/Raleigh"
alias ihatexcode="rm -rf ~/Library/Developer/Xcode/DerivedData/"
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gco="git checkout"
alias gr="git rebase"
alias gl="git log"
alias emacs="emacs -f server-start"
alias emacsc="emacsclient -c"
alias quiver="emacsc ~/Dropbox/Documents/Quiver/"

###### Other #######
export GREP_OPTIONS='--color=auto'

ia() {
   for FILE in "$@"; do
      if [ ! -e "$FILE" ]; then
        touch "$FILE"
      fi
   done
   open -a "iA Writer" "$@"
}

eval "$(rbenv init -)"

source $HOME/.android_profile
