### Image build

```
TAG=ghcr.io/randomcoww/kapprover:$(date -u +'%Y%m%d')

podman build \
  -t $TAG . && \

podman push $TAG
```

### Env

```
podman run -it --rm \
  -v $(pwd):/go/src/github.com/coreos/kapprover \
  -w /go/src/github.com/coreos/kapprover \
   golang:alpine sh
```