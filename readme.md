# jonnylangefeld/toolbox

A docker container with my most used tools to run in container orchestrations platforms.

## Build

### Single platform (ARM64 on Mac, AMD64 on Intel)

```shell
docker build -t jonnylangefeld/toolbox .
```

### Multi-platform (ARM64 + AMD64)

```shell
# Enable buildx if not already enabled
docker buildx create --use --name multi-platform-builder || docker buildx use multi-platform-builder

# Build and push multi-platform image
docker buildx build --platform linux/amd64,linux/arm64 -t jonnylangefeld/toolbox --push .
```

## Run

```shell
docker run -it jonnylangefeld/toolbox
```
