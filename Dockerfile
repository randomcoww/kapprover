FROM       golang:alpine AS BUILD
MAINTAINER Quentin Machu <quentin.machu@coreos.com>

WORKDIR /go/src/github.com/coreos/kapprover
COPY . .
RUN set -x \
  \
  && go install ./cmd/kapprover

FROM alpine:edge
COPY --from=BUILD /go/bin/kapprover /kapprover
ENTRYPOINT ["/kapprover"]