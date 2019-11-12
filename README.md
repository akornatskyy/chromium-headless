# Chromium Headless Docker Library

[![Build Status](https://travis-ci.org/akornatskyy/chromium-headless.svg?branch=master)](https://travis-ci.org/akornatskyy/chromium-headless) [![Docker Image](https://images.microbadger.com/badges/image/akorn/chromium-headless.svg)](https://microbadger.com/images/akorn/chromium-headless) [![Docker Version](https://images.microbadger.com/badges/version/akorn/chromium-headless.svg)](https://microbadger.com/images/akorn/chromium-headless)

## Images

These [images](https://hub.docker.com/r/akorn/chromium-headless) are based on
the [Alpine Linux](https://alpinelinux.org/).

## How to use

The default docker entrypoint:

```sh
chromium-browser --headless --user-data-dir=/data \
  --disable-gpu --disable-software-rasterizer \
  --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222
```

Run chromium in [sandbox](https://chromium.googlesource.com/chromium/src/+/master/docs/design/sandbox.md) (requires SYS_ADMIN capability):

```sh
docker run -it --rm --name=chromium-headless \
  -p=0.0.0.0:9222:9222 --cap-add=SYS_ADMIN --shm-size=256Mb \
  -v /tmp/chromium-data/:/data akorn/chromium-headless:alpine
```

You can add additional command line switches, e.g. prevent chromium from
loading images:

```sh
docker run -it --rm --name=chromium-headless \
  -p=0.0.0.0:9222:9222 --cap-add=SYS_ADMIN --shm-size=256Mb \
  -v /tmp/chromium-data/:/data akorn/chromium-headless:alpine \
  --blink-settings=imagesEnabled=false --mute-audio
```

See [chromium command line switches](https://peter.sh/experiments/chromium-command-line-switches/)
for more information.