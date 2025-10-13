FROM alpine:latest
WORKDIR /app
VOLUME /config /downloads /media
RUN apk add --no-cache curl icu-libs jq libintl sqlite-libs
RUN curl -fsSL $(curl -s https://api.github.com/repos/Sonarr/Sonarr/releases/latest \
    | jq -r '.assets[].browser_download_url | select(test("linux-musl-x64"))') \
    | tar xz --strip-components=1 \
    && rm -rf Sonarr.Update
EXPOSE 8989
ENTRYPOINT ["/app/Sonarr","-data=/config","-nobrowser"]
