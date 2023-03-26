#!/bin/sh

set -eu

[ -e "${HOME}/.zshrc" ] || cat << EOF > "${HOME}/.zshrc"
export PATH="\${HOME}/.krew/bin:\${PATH}"

alias k=kubectl
EOF
