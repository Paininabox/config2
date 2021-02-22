#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=screen-256color-bce
export FZF_DEFAULT_COMMAND='find . -path '*/\.cache\/*' -prune -o -type f -print -o -type l -print 2> /dev/null'

#function to combine cd and mkdir!

mkcdir()
{
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

pdffind()
{
	find . -name '*.pdf' -exec sh -c 'pdftotext -q "{}" - | grep -A 2 -B 2 -n --with-filename --label="{}" --color '$1'' \;
	
}

#search text files for string, then open to that file at that line in vim
sf() {
	  if [ "$#" -lt 1 ]; then echo "Supply string to search for!"; return 1; fi
	    printf -v search "%q" "$*"
	      include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst"
	        exclude=".config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist"
		  rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
		    files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
		      [[ -n "$files" ]] && ${EDITOR:-vim} $files
	      }
alias config='/usr/bin/git --git-dir=/home/dustin/.cfg --work-tree=/home/dustin'
