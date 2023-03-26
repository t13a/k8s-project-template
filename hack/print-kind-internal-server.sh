#!/bin/sh

set -eu

kind_cluster_name="${1}"

kind get kubeconfig --internal --name "${kind_cluster_name}" \
| yq -o json . \
| jq -r --arg cluster_name "kind-${kind_cluster_name}" '.clusters[]|select(.name==$cluster_name).cluster.server'
