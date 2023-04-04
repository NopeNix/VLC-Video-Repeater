try {
    Invoke-WebRequest -Uri http://127.0.0.1:8080/ -Method Head -ErrorAction Stop
    exit 0
}
catch {
    exit 1
}

