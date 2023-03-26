#!/bin/sh

set -eu

[ -e "${HOME}/.bashrc" ] || cat << EOF > "${HOME}/.bashrc"
export PATH="\${HOME}/.krew/bin:\${PATH}"

alias k=kubectl
source <(kubectl completion bash)
complete -F __start_kubectl k
EOF
