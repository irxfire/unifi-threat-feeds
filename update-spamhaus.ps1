# Spamhaus DROP list URL
$url = "https://www.spamhaus.org/drop/drop.txt"

# Download the file
$response = Invoke-WebRequest `
    -Uri $url `
    -Headers @{ "User-Agent" = "Mozilla/5.0" }

# Get content
$content = $response.Content

# Clean the list
$clean = $content -split "`n" |
    ForEach-Object { $_.Trim() } |
    Where-Object {
        $_ -ne "" -and
        -not $_.StartsWith(";")
    } |
    ForEach-Object {
        ($_ -split ";")[0].Trim()
    }

# Write output file
$clean | Set-Content "spamhaus-unifi.txt"

# Display count
Write-Host "Created spamhaus-unifi.txt with $($clean.Count) entries"
