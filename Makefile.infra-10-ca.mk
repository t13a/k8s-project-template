GEN_FILES_NON_IDEMPOTENT += infra/ca/ca.key
infra/ca/ca.key: NUMBITS = $(call from_env,infra/ca/ca.env,NUMBITS)
infra/ca/ca.key:
	openssl genrsa -out $@ $(NUMBITS)

GEN_FILES_NON_IDEMPOTENT += infra/ca/ca.crt
infra/ca/ca.crt: DAYS = $(call from_env,infra/ca/ca.env,DAYS)
infra/ca/ca.crt: SUBJ = $(call from_env,infra/ca/ca.env,SUBJ)
infra/ca/ca.crt: infra/ca/ca.key
	openssl req -x509 -new -nodes -key $^ -subj '$(SUBJ)' -days $(DAYS) -out $@
