FROM python:alpine
WORKDIR /app
VOLUME /config /media
RUN apk add --no-cache curl \
 && curl -fsSL https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip -o bazarr.zip \
 && unzip -q bazarr.zip \
 && rm bazarr.zip \
 && mkdir bin \
 && pip install --no-cache-dir -r requirements.txt
EXPOSE 6767
ENTRYPOINT ["python","bazarr.py","--no-update","--config","/config"]
HEALTHCHECK CMD curl -f http://localhost:6767/system/status || exit 1
