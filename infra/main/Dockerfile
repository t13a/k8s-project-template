FROM alpine:edge

RUN apk add --no-cache \
        curl \
        gcompat \
        libstdc++ \
        libc6-compat
ARG CODE_SERVER_VERSION=4.10.1
ARG CODE_SERVER_ARCH=linux-amd64
ARG CODE_SERVER_URL=https://github.com/coder/code-server/releases/download/v${CODE_SERVER_VERSION}/code-server-${CODE_SERVER_VERSION}-${CODE_SERVER_ARCH}.tar.gz
RUN mkdir -p /usr/local/lib/code-server \
    && curl -fL ${CODE_SERVER_URL} | tar -xz -C /usr/local/lib/code-server --strip-components=1 \
    && ln -s /usr/local/lib/code-server/bin/code-server /usr/local/bin

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk add --no-cache \
        bash \
        bash-completion \
        crane \
        docker-cli \
        docker-cli-buildx \
        docker-cli-compose \
        git \
        git-bash-completion \
        helm \
        helm-bash-completion \
        jq \
        kind \
        kind-bash-completion \
        kubectl \
        kubectl-bash-completion \
        kubectl-krew \
        kustomize \
        kustomize-bash-completion \
        make \
        openssl \
        sudo \
        yq

ARG KREW_ROOT=/usr/local/lib/krew
RUN apk add --no-cache \
        fzf \
        ncurses \
    && mkdir -p ${KREW_ROOT} \
    && kubectl krew install \
        access-matrix \
        cert-manager \
        ctx \
        deprecations \
        ingress-nginx \
        kubescape \
        lineage \
        ns \
        resource-capacity \
        score \
        stern \
        tail \
        tree \
    && find ${KREW_ROOT} -type d -perm 700 -exec chmod a+x {} \;
ENV PATH=${KREW_ROOT}/bin:${PATH}

RUN adduser -s /bin/bash -DH main \
    && chmod o+w /etc/group /etc/passwd

COPY rootfs /

ENTRYPOINT ["/entrypoint.sh"]
