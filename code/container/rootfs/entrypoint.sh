#!/bin/sh

set -eu

for script in /entrypoint.d/*.sh
do
    echo "${0}: Executing ${script}" >&2
    "${script}"
done

echo "${0}: Executing ${@}" >&2
exec "${@}"
