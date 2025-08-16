FROM golang:alpine AS build

WORKDIR /go/src/github.com/coreos/kapprover
COPY . .
RUN set -x \
  \
  && CGO_ENABLED=0 GO111MODULE=on GOOS=linux go build -v -ldflags '-s -w' -o kapprover ./cmd/kapprover

FROM scratch

COPY --from=build /go/src/github.com/coreos/kapprover/kapprover /
ENTRYPOINT ["/kapprover"]
