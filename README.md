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
      interval: 1s
      timeout: 1s
      retries: 30
    restart: unless-stopped
```