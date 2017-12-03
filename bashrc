#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\t|\[\033[01;32m\]\u@\h\[\033[01;34m\]:\w\$\[\033[00m\] '
#PS1='\t|'$PS1

export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=~/.bash_eternal_history

shopt -s checkwinsize
shopt -s histappend

if [[ -x /usr/bin/exa ]]; then
  alias ls='exa'
  alias l='exa -lg --time-style=long-iso'
  alias ll='exa -lga --time-style=long-iso'
else
  alias ls='ls --color=auto -N'
  alias l='ls -lF --time-style=long-iso'
  alias ll='ls -alF --time-style=long-iso'
fi
alias vim='nvim -p'
alias vimdiff='nvim -d'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias zgrep='zgrep --color=auto'
alias pcregrep='pcregrep --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:${PATH}
export PATH=${HOME}/bin:${PATH}
export PATH=${HOME}/.local/bin/:${PATH}
export PATH=${HOME}/node_modules/.bin:${PATH}
export PATH=${HOME}/.gem/ruby/2.4.0/bin/:${PATH}
export PATH=${HOME}/.luarocks/bin/:${PATH}
export EDITOR=nvim
export PAGER=less
#export DISPLAY=:0.0
export MOSH_PREDICTION_DISPLAY=always
export MPD_HOST=~/.config/mpd/socket
#export WHOIS_SERVER=whois.apnic.net
export PYTHONDONTWRITEBYTECODE=True
export PIP_DISABLE_PIP_VERSION_CHECK=1

if [ -e $HOME/.pythonrc.py ]; then
 export PYTHONSTARTUP=$HOME/.pythonrc.py
fi

#if [[ $TERM == xterm-termite ]]; then
#  . /etc/profile.d/vte.sh
#  __vte_prompt_command
#  export TERM=xterm-256color
#fi

source ~/git/z/z.sh
#source ~/.bash-powerline.sh
#source ~/.promptline.sh

# fzf
#source /usr/share/fzf/completion.bash
#source /usr/share/fzf/key-bindings.bash
#source /etc/profile.d/fzf-extras.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--exact --no-mouse"

alias t="tmux has-session -t $USER && exec tmux attach -t $USER || exec tmux new -s $USER"


source /usr/local/Cellar/git/2.15.1/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]:\w\$\[\033[00m\]$(__git_ps1) '

[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
