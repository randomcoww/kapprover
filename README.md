### Dev

```
podman run -it --rm \
  -v $(pwd):/go/src/kapprover \
  -w /go/src/kapprover \
   golang:alpine sh
```