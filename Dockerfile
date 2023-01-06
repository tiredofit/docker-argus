ARG DISTRO=alpine
ARG DISTRO_VARIANT=3.17

FROM docker.io/tiredofit/nginx:${DISTRO}-${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG ARGUS_VERSION

ENV ARGUS_VERSION=${ARGUS_VERSION:-"0.11.0"} \
    ARGUS_REPO_URL=https://github.com/release-argus/Argus \
    NGINX_SITE_ENABLED="argus" \
    NGINX_ENABLE_CREATE_SAMPLE_HTML=FALSE \
    IMAGE_NAME="tiredofit/argus" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-argus/"

RUN source assets/functions/00-container && \
    set -x && \
    addgroup -S -g 10000 argus && \
    adduser -D -S -s /sbin/nologin \
            -h /dev/null \
            -G argus \
            -g "argus" \
            -u 10000 argus \
            && \
    \
    package update && \
    package upgrade && \
    package install .argus-build-deps \
                    git \
                    go \
                    make \
                    nodejs \
                    npm \
                    yarn \
                    && \
    \
    clone_git_repo "${ARGUS_REPO_URL}" "${ARGUS_VERSION}" && \
    make && \
    make build && \
    cp -R argus /usr/sbin && \
    mkdir -p /assets/argus && \
    cp -R config.yml.example /assets/argus && \
    package remove .argus-build-deps && \
    package cleanup && \
    rm -rf /root/.cache \
           /root/.gitconfig \
           /root/go \
           /usr/src/*

EXPOSE 10000

COPY install /

