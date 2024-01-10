FROM alpine:latest
WORKDIR /app
VOLUME /config /downloads /media
RUN apk add --no-cache curl icu-libs jq libintl sqlite-libs
RUN curl -fsSL $(curl https://services.sonarr.tv/v1/releases \
    | jq -r '."v4-stable".linuxMusl.x64.archive.url') \
    | tar xz --strip-components=1 \
    && rm -rf Sonarr.Update
EXPOSE 8989
ENTRYPOINT ["/app/Sonarr","-data=/config","-nobrowser"]
HEALTHCHECK CMD curl -f http://localhost:8989/system/status || exit 1
