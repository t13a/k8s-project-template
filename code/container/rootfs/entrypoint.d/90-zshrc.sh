#!/bin/sh

[ -e "${HOME}/.zshrc" ] || cat << EOF > "${HOME}/.zshrc"
alias d=docker
alias k=kubectl

export PATH="\${HOME}/.krew/bin:\${PATH}"
EOF
