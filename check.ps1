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
        Throw("Less than 5000bytes received, assuming this is no valid stream!")
    }

    Write-Host ("Received enought data, looks like everything is working")
    exit 0
}
catch {
    Write-Host ("Did not receive enough data to be convinced to be a solid stream")
    exit 1
}

