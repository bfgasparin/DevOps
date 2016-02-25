#
# Function to updated docker bash command line compleion files
# 
# @author Bruno Ferme Gasparin <bfgasparin@gmail.com>
#

__fetch_docker_completion_files () {

    case "$1" in
        -h|--help)
            cat <<EOF
Usage: 
    completion-update-docker [COMPLETION-DIR]
    completion-update-docker -h|--help

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

    curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o $dir/docker-compose.bash

    curl -L https://raw.githubusercontent.com/docker/docker/v$(docker version --format '{{.Client.Version}}')/contrib/completion/bash/docker -o $dir/docker.bash

	local files=(docker-machine docker-machine-wrapper docker-machine-prompt)
	for f in "${files[@]}"; do
	  curl -L https://raw.githubusercontent.com/docker/machine/v$(docker-machine --version | tr -ds ',' ' ' | awk 'NR==1{print $(3)}')/contrib/completion/bash/$f.bash -o $dir/$f.bash
	done

	echo "Files installed at '$dir'"    
}

alias completion-update-docker=__fetch_docker_completion_files
