while ($true) {
    Write-Host "Starting Repeater..."

    # Start Job
    $Repeater = Start-Job -ScriptBlock {
        while ($true) {   
            Start-Process -Wait -FilePath "cvlc" -ArgumentList $env:SourceURL, "--sout", "#transcode{vcodec=MJPG,venc=ffmpeg{strict=1}}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:8080}"
            Write-Host "cvlc process has ended with Code $?"
        }
    } 

    # Wait 10 seconds
    Write-Host ("Waiting 10 Seconds for Stream to be stable...")
    Start-Sleep -Seconds 20

    # Check if stream works now
    $streamworks = $true
    Write-Host ("Stream Monitoring started! Monitoring Stream: " + $env:SourceURL)
    while ($streamworks) {
        try {
            Invoke-WebRequest -Uri http://127.0.0.1:8080/ -TimeoutSec 5 -Method Head -ErrorAction Stop | Out-Null
    
            # Define the curl output
            $curlOutput = curl http://127.0.0.1:8080/ -m 3 2>&1
    
            # Define the regex pattern
            $pattern = "with (\d+) bytes received"
    
            # Extract the bytes received using regex
            [int]$bytesReceived = [regex]::Match($curlOutput, $pattern).Groups[1].Value
    
            # Display the bytes received
            Write-Output "Bytes received: $bytesReceived"
            if ($bytesReceived -le "5000") {
                Write-Host ("Less than 5000bytes received, assuming this is no valid stream!")
                $streamworks = $false
            } else {
                Write-Host ("Received enought data, looks like everything is working, checking again in 5 seconds...")
                Start-Sleep -Seconds 5
            }
        
        }
        catch {
            $streamworks = $false
            Write-Host ("Did not receive enough data to be convinced that this is a working stream")
        }
    }
    Stop-Job $Repeater
}   
