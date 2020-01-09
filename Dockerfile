FROM golang:alpine AS BUILD
# Modified - original maintainer:
# MAINTAINER Quentin Machu <quentin.machu@coreos.com>

WORKDIR /go/src/github.com/coreos/kapprover
COPY . .
RUN set -x \
  \
  && CGO_ENABLED=0 GO111MODULE=on GOOS=linux \
    go build -v -a -ldflags '-w -s -extldflags "-static"' \
    -o kapprover ./cmd/kapprover

FROM scratch

COPY --from=BUILD /go/src/github.com/coreos/kapprover/kapprover /
ENTRYPOINT ["/kapprover"]