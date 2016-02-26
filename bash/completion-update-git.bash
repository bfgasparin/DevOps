#!/bin/bash
#
# Function to updated git bash command line completion files
# 
# To have access to the function either:
#  - place this file in /etc/bash_completion.d
#  or
#  - copy this file to e.g. ~/.completion-update-git.bash and add the line
#    below to your .bashrc 
#    . ~/.completion-update-git.bash
#    
# @author Bruno Ferme Gasparin <bfgasparin@gmail.com>
#

__fetch_git_completion_files () {

    case "$1" in
        -h|--help)
            cat <<EOF
Usage: 
    completion-update-git [COMPLETION-DIR]
    completion-update-git -h|--help

Download and update the git bash command line completion files to COMPLETION-DIR directory
Also download and update the git bash prompt that allows you to see git repository in your prompt

Dowloaded Files:
  - git-completion.bash
  - git-prompt.sh

To enable the files:

    1) Copy this file to somewhere (e.g. ~/.git-prompt.sh).
    2) Add the following line to your .bashrc/.zshrc:
        source ~/.git-prompt.sh
    3a) Change your PS1 to call __git_ps1 as
        command-substitution:
        Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '   

Description:
   Argument is the directory where the completion files will be installed. Detault to '~/bash/completion'

EOF
			return
            ;;
    esac

    local dir=${HOME}'/bash/completion'
    if ! [ -z "$1" ]
	then
	    dir=$1
	fi
    
	local files=(git-completion.bash git-prompt.sh)
	for f in "${files[@]}"; do
	  curl -L https://raw.githubusercontent.com/git/git/v$(git --version | tr -ds '' '' | awk 'NR==1{print $(3)}')/contrib/completion/$f -o $dir/$f
      echo https://raw.githubusercontent.com/git/git/v$(git --version | tr -ds '' '' | awk 'NR==1{print $(3)}')/contrib/completion/$f
	done

	echo "Files installed at '$dir'"    
}

alias completion-update-git=__fetch_git_completion_files
