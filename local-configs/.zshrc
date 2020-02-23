# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/martin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh




# User configuration




# Exports
export PAGER=less;
export EDITOR=vim;
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
export LSCOLORS="cxfxcxdxbxegedabagacad"
export MANWIDTH="76"
export XDG_CONFIG_HOME=/home/martin/.local
export JAVA_HOME="/home/martin/Programs/jdk1.8.0_172"
#export JAVA_HOME="/home/martin/Programs/jdk-11.0.2"
#export GOPATH=/home/martin/Programming/Go
export GOPATH=/tmp/go
#export LANG=en_US.UTF-8

if [[ ! "$PATH" == */home/martin/Programs/flutter/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/martin/Programs/flutter/bin"
fi

if [[ ! "$PATH" == */home/martin/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/martin/bin"
fi
if [[ ! "$PATH" == */home/martin/Programs/go/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/martin/Programs/go/bin"
fi
if [[ ! "$PATH" == */home/martin/Programs/node/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/martin/Programs/node/bin"
fi

# Color prompt
if [[ "$USER" == "root" ]] then

  PROMPT="%{$fg_no_bold[white]%}%n @ %{$fg_no_bold[yellow]%}%m %{$fg_no_bold[blue]%}%1d %(!.###.>>>) %{$reset_color%}"

else

  if [[ $(hostname) == "probook-pc" ]]; then
    PROMPT="%{$fg_no_bold[white]%}%n at %{$fg_no_bold[cyan]%}%m %{$fg_no_bold[white]%}%1d %(!.###.>>>) %{$reset_color%}"
  elif [[ $(hostname) == "probook-work" ]]; then
    PROMPT="%{$fg_no_bold[white]%}%n at %{$fg_no_bold[cyan]%}%m %{$fg_no_bold[white]%}%1d %(!.###.>>>) %{$reset_color%}"
  else
    PROMPT="%{$fg_no_bold[white]%}%n at %{$fg_bold[cyan]%}%m %{$fg_no_bold[white]%}%1d %(!.###.>>>) %{$reset_color%}"
  fi

fi



# Aliases

alias ls='ls --color'
alias sl='ls'
alias ll='ls -l'
alias l.='ls -d .*'

alias psg='ps -aux | grep '

alias gs='git status'
alias gc='git commit'
alias gca='f(){ git commit -a --fixup=$1 && git rebase -i --autosquash origin/master"; unset -f f;}; f'
alias gl='git log'
alias ga='git add'
alias gr='git reset'
alias grh='git reset --hard HEAD'
alias gb='git branch'
alias gf='git fetch'
alias gbr='/home/martin/bin/git-branch-remove'

alias gci='f(){ git commit -m "IssueTracker$1"; unset -f f;}; f'
alias gbc='git branch | fzf | xargs git checkout'

#alias gfr='f(){ git fetch && git rebase $1; unset -f f;}; f'
#alias gfrm="git pull origin $(gs | head -1 | awk '{{ print $3 }}') && git fetch && git rebase origin/master"
alias gp='git push -u origin HEAD;'
alias gpf='git push -u --force-with-lease origin HEAD'


alias copy='rsync --info=progress2 -a'
alias cpp='rsync --info=progress2 -a'

alias sduo='sudo'

alias mycli='export LESS="-XSRF" && mycli'
alias gssh='gcloud compute ssh'
alias gscp='gcloud compute scp'

alias apt-version='apt-cache policy'
alias aptversion='apt-cache policy'
alias aptv='apt-cache policy'

alias vim='nvim'
alias transcs='trans -no-auto -t cs+en'
alias transen='trans -no-auto -t en+cs'


source <(kubectl completion zsh)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/martin/Programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/martin/Programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/martin/Programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/martin/Programs/google-cloud-sdk/completion.zsh.inc'; fi


source /home/martin/Environments/env-devel
source "/home/martin/.sdkman/bin/sdkman-init.sh"
# Line below was generated by gql installer, DO NOT EDIT
. <(gql completion zsh)
