CLUSTER_UP_ADDONS_TARGETS += cluster/up/cert-manager
.PHONY: cluster/up/cert-manager
cluster/up/cert-manager:
	kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.9.1/cert-manager.yaml | hack/colorize-kubectl-apply.awk # TODO stay up to date
	while ! kubectl wait -n cert-manager deploy -l app.kubernetes.io/name=cert-manager --for=condition=Available=True --timeout=30s; do sleep 1; done
