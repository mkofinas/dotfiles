if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

export PATH="/home/mkofinas/.local/share/cargo/bin:$PATH"

if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi
export MYQUOTA_PROJECTSPACES=guse0564
accinfo
myquota
