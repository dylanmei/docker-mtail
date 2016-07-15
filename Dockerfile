FROM golang:1.5-alpine

WORKDIR /go/src/github.com/google/mtail
RUN apk add --update --no-cache --virtual build-dependencies git make \
 && git clone https://github.com/google/mtail /go/src/github.com/google/mtail \
 && make install_deps \
 && go build -o /usr/bin/mtail \
 && apk del build-dependencies

ENTRYPOINT ["mtail"]
