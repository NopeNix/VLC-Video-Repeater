# VLC-Video-Repeater

This Comtainer can read any stream VLC can read and acceppts multiple clients 

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
    restart: unless-stopped
```