#!/bin/sh

set -eu

while [ ${#@} -ge 1 ]
do
    case "${1}" in
        --)
            shift
            break
            ;;
        *)
            set -a
            source "$(realpath "${1}")"
            set +a
            shift
            ;;
    esac
done

exec "${@}"
