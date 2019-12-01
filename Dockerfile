FROM       golang:alpine AS BUILD
# Modified - original maintainer:
MAINTAINER Quentin Machu <quentin.machu@coreos.com>

WORKDIR /go/src/github.com/coreos/kapprover
COPY . .
RUN set -x \
  \
  && GO111MODULE=on GOOS=linux \
    go install ./cmd/kapprover

FROM alpine:edge

COPY --from=BUILD /go/bin/kapprover /kapprover
ENTRYPOINT ["/kapprover"]
