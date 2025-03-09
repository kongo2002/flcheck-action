FROM alpine:latest

LABEL com.github.actions.name="flcheck"
LABEL com.github.actions.description="Check your flutter app dependencies with flcheck"
LABEL com.github.actions.icon="feather"
LABEL com.github.actions.color="blue"

LABEL repository="https://github.com/kongo2002/flcheck-action"

RUN apk add --no-cache openssl

ARG VERSION=1.2.1

ADD https://github.com/kongo2002/flcheck/releases/download/v$VERSION/flcheck-v$VERSION-x86_64-unknown-linux-musl.tar.gz /tmp

RUN cd /usr/bin && \
    tar xvf /tmp/flcheck-v$VERSION-x86_64-unknown-linux-musl.tar.gz flcheck && \
    rm /tmp/flcheck*

ENTRYPOINT [ "flcheck" ]
CMD [ "-h" ]
