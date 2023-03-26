#!/bin/sh

set -eu

inplace_replace() {
    exp="${1}"
    file="${2}"
    out="$(sed -r "${exp}" "${file}")" # `-i` causes permission denied (temporary file can not be created in `/etc`).
    echo "${out}" > "${file}"
}

[ -w /etc/group ] && [ -w /etc/passwd ] || exit 0

inplace_replace "s|^(main):([^:]*):([^:]*)|\\1:\\2:${MAIN_GID}|" /etc/group
inplace_replace "s|^(main):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*)|\\1:\\2:${MAIN_UID}:${MAIN_GID}:\\5:\\6:\\7|" /etc/passwd

sudo chmod o-w /etc/group /etc/passwd
