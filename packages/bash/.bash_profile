if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

. "/home/mkofinas/.local/share/cargo/env"

if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi
export MYQUOTA_PROJECTSPACES=guse0564
accinfo
myquota
