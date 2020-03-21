if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

if [ -f "${HOME}/Libraries/torch/install/bin/torch-activate" ]; then
  . "${HOME}/Libraries/torch/install/bin/torch-activate"
fi

export PATH="/home/miltos/.local/share/cargo/bin:$PATH"
