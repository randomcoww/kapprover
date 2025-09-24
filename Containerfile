FROM docker.io/golang:1.25.1-alpine AS build

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
