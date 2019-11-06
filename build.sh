#!/bin/bash
set -eo pipefail


cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"
tags=( */ )
for tag in "${tags[@]%/}" ; do
  image=akorn/chromium-headless:${tag}
  echo building $image ...
  docker build -t ${image} ${tag}

  version=$(docker run --rm --entrypoint chromium-browser ${image} \
      --product-version)
  docker tag ${image} akorn/chromium-headless:${version}-${tag}

  major=$(echo $version | cut -d. -f1)
  docker tag ${image} akorn/chromium-headless:${major}-${tag}

  echo
  echo "version ${version}"
done
