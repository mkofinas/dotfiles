#!/bin/bash

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-hs] [DIRECTORY] ...
Download mkofinas/dotfiles repository from https://github.com/ using HTTPS
or SSH and save it in DIRECTORY. The default method is HTTPS.

    -h          display this help and exit
    -s          clone with 'SSH' instead of 'HTTPS'
EOF
}

dl_type="https"

OPTIND=1
while getopts ":sh" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    s)
      dl_type="ssh"
      ;;
    '?')
      echo "Invalid option: -$OPTARG" >&2
      show_help >&2
      exit 1
      ;;
  esac
done

shift "$((OPTIND-1))"

repository_dir=$1
if [[ -z $repository_dir ]]; then
  repository_dir="dotfiles"
fi
if [[ -d $repository_dir && "$(ls -A $repository_dir)" ]]; then
  echo "Directory $repository_dir exists and is not empty." >&2
  exit 1
fi

if [[ $dl_type == "ssh" ]]; then
  remote_url="git@github.com:mkofinas/dotfiles.git"
else
  remote_url="https://github.com/mkofinas/dotfiles.git"
fi

git clone --recursive "${remote_url}" "${repository_dir}"
cd "${repository_dir}"
./install.sh

