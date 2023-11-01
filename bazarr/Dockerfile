FROM debian:latest
WORKDIR /app
VOLUME /config /media
RUN apt-get update && apt-get install --no-install-recommends -y curl ffmpeg unar unzip python3-venv \
 && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip -o bazarr.zip \
 && unzip -q bazarr.zip \
 && rm bazarr.zip \
 && python3 -m venv . \
 && /app/bin/pip install --no-cache-dir -r requirements.txt
EXPOSE 6767
ENTRYPOINT ["/app/bin/python","bazarr.py","--no-update","--config","/config"]
HEALTHCHECK CMD curl -f http://localhost:6767/system/status || exit 1
