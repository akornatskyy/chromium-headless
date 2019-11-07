#!/bin/sh
set -eo pipefail


cd "$(dirname "$0")"
tags=$(ls -d */)
for tag in ${tags%/*} ; do
  image=akorn/chromium-headless:${tag}
  echo building $image ...
  docker build -t ${image} ${tag}

  version=$(docker run --rm --entrypoint chromium-browser ${image} \
      --product-version)
  docker tag ${image} akorn/chromium-headless:${version}-${tag}

  major=$(echo $version | cut -d. -f1)
  docker tag ${image} akorn/chromium-headless:${major}-${tag}

  echo
  echo "version ${major} (${version})"
done
