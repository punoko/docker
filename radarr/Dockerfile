FROM alpine:latest
WORKDIR /app
VOLUME /config /downloads /media
RUN apk add --no-cache curl icu-libs jq libintl sqlite-libs
RUN curl -fsSL $(curl -s https://api.github.com/repos/Radarr/Radarr/releases/latest \
    | jq -r '.assets[].browser_download_url | select(test("linux-musl-core-x64"))') \
    | tar xz --strip-components=1 \
    && rm -rf Radarr.Update
EXPOSE 7878
ENTRYPOINT ["/app/Radarr","-data=/config","-nobrowser"]
