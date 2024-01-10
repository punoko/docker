FROM alpine:latest
WORKDIR /app
VOLUME /config
RUN apk add --no-cache curl icu-libs jq libintl sqlite-libs
RUN curl -fsSL $(curl -s https://api.github.com/repos/prowlarr/prowlarr/releases/latest \
    | jq -r '.assets[].browser_download_url | select(test("linux-musl-core-x64"))') \
    | tar xz --strip-components=1 \
    && rm -rf Prowlarr.Update
EXPOSE 9696
ENTRYPOINT ["/app/Prowlarr","-data=/config","-nobrowser"]
HEALTHCHECK CMD curl -f http://localhost:9696/system/status || exit 1
