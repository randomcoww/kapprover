FROM docker.io/golang:alpine@sha256:b6ed3fd0452c0e9bcdef5597f29cc1418f61672e9d3a2f55bf02e7222c014abd AS build

WORKDIR /go/src
COPY . .
RUN set -x \
  \
  && go mod tidy \ 
  && CGO_ENABLED=0 GO111MODULE=on GOOS=linux \
    go build -v -ldflags '-s -w' -o kapprover ./cmd/kapprover \
  && go test ./...

FROM scratch

COPY --from=build /go/src/kapprover /bin/
ENTRYPOINT ["/bin/kapprover"]
