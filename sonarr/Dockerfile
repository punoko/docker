FROM alpine:latest
WORKDIR /app
VOLUME /config /downloads /media
RUN apk add --no-cache curl icu-libs libintl sqlite-libs
RUN curl -fsSL "https://services.sonarr.tv/v1/download/develop/latest?version=4&os=linux-musl&arch=x64" \
  | tar xz --strip-components=1 \
 && rm -rf Sonarr.Update
EXPOSE 8989
ENTRYPOINT ["/app/Sonarr","-data=/config","-nobrowser"]
HEALTHCHECK CMD curl -f http://localhost:8989/system/status || exit 1
