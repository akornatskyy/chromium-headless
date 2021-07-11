# Chromium Headless Docker Library

![image](https://github.com/akornatskyy/chromium-headless/workflows/image/badge.svg)

## Images

These [images](https://hub.docker.com/r/akorn/chromium-headless) are based on
the [Alpine Linux](https://alpinelinux.org/) (linux/amd64, linux/arm64).

## How to use

The default docker entrypoint:

```sh
chromium-browser --headless --headless \
  --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 \
  --user-data-dir=/data --disable-software-rasterizer --disable-dev-shm-usage
```

Run chromium in [sandbox](https://chromium.googlesource.com/chromium/src/+/master/docs/design/sandbox.md) (requires SYS_ADMIN capability):

```sh
docker run -it --rm --name=chromium-headless \
  -p=0.0.0.0:9222:9222 --cap-add=SYS_ADMIN \
  -v /tmp/chromium-data/:/data akorn/chromium-headless:alpine
```

You can add additional command line switches, e.g. prevent chromium from
loading images:

```sh
docker run -it --rm --name=chromium-headless \
  -p=0.0.0.0:9222:9222 --cap-add=SYS_ADMIN \
  -v /tmp/chromium-data/:/data akorn/chromium-headless:alpine \
  --blink-settings=imagesEnabled=false --mute-audio
```

See [chromium command line switches](https://peter.sh/experiments/chromium-command-line-switches/)
for more information.
