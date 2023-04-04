Write-Host "[Script] Starting Repeater..."

do {

    Start-Process -Wait -FilePath "cvlc" -ArgumentList $env:SourceURL, "--sout", "#transcode{vcodec=MJPG,venc=ffmpeg{strict=1}}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:8080}"
    Write-Host "[Script] cvlc process has ended with Code $?"
    Write-Host "[Script] Retrying in 10 Seconds..."
    Start-Sleep -Seconds 10
} until (
    $false
) 
Write-Host "[Script] Script End"