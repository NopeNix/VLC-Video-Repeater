FROM mcr.microsoft.com/powershell:lts-alpine-3.14

RUN apk update
RUN apk add --update --no-cache vlc
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc
ENV DISPLAY=:0.0

RUN mkdir /app
COPY ./script.ps1 /app/script.ps1

CMD pwsh /app/script.ps1
