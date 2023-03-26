#!/bin/sh

set -eu

network_name="${1}"
container_name="${2}"

docker inspect --format "{{ (index .NetworkSettings.Networks \"${network_name}\").IPAddress }}" "${container_name}"
