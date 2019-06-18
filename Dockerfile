FROM alpine:3.9

ARG NODEJS_VERSION=10.14.2-r0
ARG MODULE_VERSION=1.17.1

RUN set -x && \
    apk add --no-cache nodejs=${NODEJS_VERSION} nodejs-npm=${NODEJS_VERSION} && \
    npm install -g prettier@${MODULE_VERSION} && \
    npm cache clean --force && \
    apk del nodejs-npm

ENTRYPOINT ["/usr/bin/prettier"]
CMD ["--help"]