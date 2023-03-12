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
    git-zsh-completion \
    grml-zsh-config \
    helm \
    helm-bash-completion \
    helm-zsh-completion \
    jq \
    kind \
    kind-bash-completion \
    kind-zsh-completion \
    kubectl \
    kubectl-bash-completion \
    kubectl-zsh-completion \
    kubectl-krew \
    kustomize \
    kustomize-bash-completion \
    kustomize-zsh-completion \
    make \
    sudo \
    yq \
    zsh

RUN adduser -DH code \
    && chmod o+w /etc/group /etc/passwd

COPY rootfs /

ENTRYPOINT ["/entrypoint.sh"]
