try {
    Invoke-WebRequest -Uri http://127.0.0.1:8080/ -TimeoutSec 5 -Method Get -ErrorAction Stop 
    exit 0
}
catch {
    exit 1
}

