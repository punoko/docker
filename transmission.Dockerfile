FROM alpine:latest
RUN apk add --no-cache curl transmission-daemon
VOLUME /config /downloads
EXPOSE 9091 51413/tcp 51413/udp
ENTRYPOINT ["transmission-daemon","--foreground","--config-dir","/config"]
HEALTHCHECK CMD curl -f http://localhost:9091/transmission/web/ || exit 1
