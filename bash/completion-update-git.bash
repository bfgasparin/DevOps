#
# Function to updated git bash command line completion files
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

Download and update the docker bash command line completion files to COMPLETION-DIR directory

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
