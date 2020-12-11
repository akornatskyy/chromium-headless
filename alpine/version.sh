#@/bin/sh

version=$(docker run --rm alpine \
    sh -c 'apk -q update && apk info chromium | head -n 1 | cut -d- -f2' | \
    tr -d '\r')
