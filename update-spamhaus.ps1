$url = "https://www.spamhaus.org/drop/drop.txt"

try {
    $client = New-Object System.Net.WebClient
    $client.Headers.Add("User-Agent", "Mozilla/5.0")

    $content = $client.DownloadString($url)

    $clean = $content -split "`n" |
        ForEach-Object { $_.Trim() } |
        Where-Object {
            $_ -ne "" -and
            -not $_.StartsWith(";")
        } |
        ForEach-Object {
            ($_ -split ";")[0].Trim()
        }

    $clean | Set-Content "spamhaus-unifi.txt"

    Write-Host "Created spamhaus-unifi.txt"
    Write-Host "Entries: $($clean.Count)"
}
catch {
    Write-Host "ERROR:"
    Write-Host $_.Exception.Message
    throw
}
