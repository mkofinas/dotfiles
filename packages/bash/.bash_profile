if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

export PATH="/home/mkofinas/.local/share/cargo/bin:$PATH"
