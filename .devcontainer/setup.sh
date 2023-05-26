#!/usr/bin/env bash

# Setup shell history files
sudo mkdir -p "/shellhistory/${USER}"
sudo chown -R "${USER}:" "/shellhistory/${USER}"
touch "/shellhistory/${USER}/.bash_history"
touch "/shellhistory/${USER}/.zsh_history"

# Setup trunk
sudo mkdir -p "/trunk/${USER}"
sudo chown -R "${USER}:" "/trunk/${USER}"

# Setup bash
cat <<EOF >>~/.bashrc
eval "\$(direnv hook bash)"
eval "\$(starship init bash)"
export HISTFILE='/shellhistory/${USER}/.bash_history'
export TRUNK_CACHE='/trunk/${USER}'
EOF

# Setup zsh
cat <<EOF >>~/.zshrc
eval "\$(direnv hook zsh)"
eval "\$(starship init zsh)"
export HISTFILE='/shellhistory/${USER}/.zsh_history'
export TRUNK_CACHE='/trunk/${USER}'
EOF
