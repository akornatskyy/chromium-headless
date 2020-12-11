#!/bin/sh

set -e

cd "$(dirname "$0")"
tags=$(ls -d */ | tr -d \/)
for tag in ${tags} ; do
  image=akorn/chromium-headless:${tag}
  echo building $image ...

  . ${tag}/version.sh

  echo ${version}
  major=$(echo ${version} | cut -d. -f1)
  echo ${major}

  docker buildx build --push \
    --tag ${image} \
    --tag akorn/chromium-headless:${version}-${tag} \
    --tag akorn/chromium-headless:${major}-${tag} \
    --platform linux/amd64,linux/arm64 ${tag} \

  echo
  echo "version ${major} (${version})"
done

docker images
