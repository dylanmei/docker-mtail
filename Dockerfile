FROM golang:1.16.7-alpine3.13

WORKDIR /go/src/github.com/google/mtail
RUN apk add --update --no-cache --virtual build-dependencies git make \
 && git clone https://github.com/google/mtail /go/src/github.com/google/mtail \
 && git checkout v3.0.0-rc47 \
 && make install_deps \
 && PREFIX=/go make STATIC=y -B install

FROM alpine:3.13
COPY --from=0 /go/bin/mtail /usr/bin/mtail

ENTRYPOINT ["mtail"]
