#!/bin/sh

# ls
alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lAh'
alias l1='ls -1'
alias l2='ls -1Ah'

# gcc
alias g89='gcc -ansi -pedantic'

# git
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gC='git commit'
alias gd='git diff'
alias gg='git log --oneline --graph'
alias gs='git status'
alias gpo='git push origin $(git branch --show-current)'

# other
alias grep='grep --color=auto'
alias so='source'
alias todo='vim ~/todo'
alias dlmus='yt-dlp --extract-audio --audio-format mp3'

# compile and view LuaTeX code
function viewtex() {
	luatex "$1" && mupdf "$(echo $1 | sed 's/\.tex$/.pdf/g')"
}

# make a directory and move into it
function mkc() {
	mkdir "$1" && cd "$1"
}

# prompt
PS1=''
function prompt() {
	LOCATION="\e[1;32m$(pwd)"
	TERMINATOR="\e[1;37m>"
	POST_TERM="\e[0;37m"
	POWER_LEVEL=$(acpi -b | grep -Eo "[0-9][0-9]%" | sed 's/%//g')
	if [[ $POWER_LEVEL != '00' ]]; then
		POWER="\e[1;31mBattery: $POWER_LEVEL%"
	else
		POWER=$(printf "\b")
	fi
	PS1="$LOCATION $POWER $TERMINATOR $POST_TERM"
}
export PROMPT_COMMAND='prompt'

