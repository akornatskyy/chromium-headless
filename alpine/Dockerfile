FROM alpine

RUN set -ex \
    \
    && apk add --no-cache chromium \
    \
    && mkdir /data \
    && chown nobody /data

USER nobody
WORKDIR /data
VOLUME /data
EXPOSE 9222

ENTRYPOINT ["chromium-browser", "--headless", "--user-data-dir=/data", "--disable-gpu", "--disable-software-rasterizer", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
