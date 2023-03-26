CLUSTER_UP_ADDONS_TARGETS += cluster/up/ingress-nginx
.PHONY: cluster/up/ingress-nginx
cluster/up/ingress-nginx:
	kubectl apply -k https://github.com/kubernetes/ingress-nginx/deploy/static/provider/kind?ref=controller-v1.4.0 | hack/colorize-kubectl-apply.awk # TODO stay up to date
	kubectl label node --all --overwrite ingress-ready=true
	while ! kubectl wait pod -n ingress-nginx -l app.kubernetes.io/component=controller --for=condition=Ready --timeout=30s; do sleep 1; done
