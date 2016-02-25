# Bash Configuration

- Install and configure *bash completion* (preferred using [mac_ports](https://trac.macports.org/wiki/howto/bash-completion)).
- Copy all files from here to `~/bash` directory.
- Create and empty `~/bash/completion` directory.
- Pull the completion files
```shell
$ completion-update-git
$ completion-update-docker
```
- Rename `bash_profile` file to `.bash_profile` and move it to your home dir `~/`.

**Atention**: These scripts will install completion file according to the client version of respective installed libs. So
for scripts to work, the binaries (git, docker, docker-compose, ...) must be installed.