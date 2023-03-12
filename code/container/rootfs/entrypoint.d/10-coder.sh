#!/bin/sh

set -eu

function inplace_replace() {
    local exp="${1}"
    local file="${2}"
    local out="$(sed -r "${exp}" "${file}")" # `-i` causes permission denied (temporary file can not be created in `/etc`).
    echo "${out}" > "${file}"
}

[ -w /etc/group -a -w /etc/passwd ] || exit 0

inplace_replace "s|^(code):([^:]*):([^:]*)|\\1:\\2:${CODE_GID}|" /etc/group
inplace_replace "s|^(code):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*)|\\1:\\2:${CODE_UID}:${CODE_GID}:\\5:\\6:${CODE_SHELL}|" /etc/passwd
sudo chmod o-w /etc/group /etc/passwd
