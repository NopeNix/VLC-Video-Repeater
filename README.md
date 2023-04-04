[![Build and Push to Docker Hub](https://github.com/NopeNix/VLC-Video-Repeater/actions/workflows/Build%20and%20Push%20to%20Docker%20Hub.yml/badge.svg)](https://github.com/NopeNix/VLC-Video-Repeater/actions/workflows/Build%20and%20Push%20to%20Docker%20Hub.yml)
# VLC-Video-Repeater

This Comtainer can read any stream VLC can read and acceppts multiple clients.

It outputs the stream on: http://127.0.0.1:8080/

## Example docker-compose:
```dockerfile
version: "3"
services:
  app:
    image: nopenix/vlc-video-repeater
    environment:
      - SourceURL=https://192.168.0.69/aStream
    ports:
      - 8080:8080
    healthcheck: # Healthcheck is mandatory for the container to work propperly (especially reconnects!)
      test: pwsh /app/check.ps1
      interval: 10s
      timeout: 10s
      retries: 3
    restart: unless-stopped
```