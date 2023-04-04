FROM mcr.microsoft.com/powershell:lts-alpine-3.14

RUN apk update
RUN apk add vlc curl
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc
ENV DISPLAY=:0.0

RUN mkdir /app
COPY ./script.ps1 /app/script.ps1
COPY ./check.ps1 /app/check.ps1

#ENTRYPOINT cvlc
CMD pwsh /app/script.ps1
