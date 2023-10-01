![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/NopeNix/VLC-Video-Repeater/Build%20and%20Push%20to%20Docker%20Hub.yml?label=Build%20and%20Push%20to%20Docker%20Hub)
![GitHub issues](https://img.shields.io/github/issues-raw/NopeNix/VLC-Video-Repeater)
![Docker Stars](https://img.shields.io/docker/stars/nopenix/vlc-video-repeater)
![GitHub Repo stars](https://img.shields.io/github/stars/NopeNix/VLC-Video-Repeater?label=GitHub%20Stars)
![GitHub top language](https://img.shields.io/github/languages/top/NopeNix/VLC-Video-Repeater)
# VLC-Video-Repeater

This Comtainer can read any stream VLC can read and acceppts multiple clients.
Originally programmed to Make ESP32-CAM able to servme Multiple clients but may be used for other things, too!

It outputs the stream on: http://127.0.0.1:8080/

## Example docker-compose:
```yml
version: "3"
services:
  app:
    image: nopenix/vlc-video-repeater
    environment:
      - SourceURL=https://192.168.0.69/a-Stream
    ports:
      - 8080:8080
    restart: unless-stopped
```
