FROM golang:alpine

WORKDIR /go/src/github.com/google/mtail
RUN apk add --update --no-cache --virtual build-dependencies git make \
 && git clone https://github.com/google/mtail /go/src/github.com/google/mtail \
 && git checkout v3.0.0-rc17 \
 && make install_deps \
 && go build -o /usr/bin/mtail \
 && apk del build-dependencies

ENTRYPOINT ["mtail"]
