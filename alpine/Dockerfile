FROM alpine

RUN set -ex \
    \
    && apk add --no-cache \
        chromium \
        chromium-swiftshader \
    \
    && mkdir /data \
    && chown nobody /data

USER nobody
WORKDIR /data
VOLUME /data
EXPOSE 9222

ENTRYPOINT ["chromium-browser", "--headless", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222", "--user-data-dir=/data", "--disable-software-rasterizer", "--disable-dev-shm-usage"]
