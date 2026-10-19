# IPv4 Feed
$ipv4Url = "https://www.spamhaus.org/drop/drop.txt"

# IPv6 Feed
$ipv6Url = "https://www.spamhaus.org/drop/dropv6.txt"

function Get-CleanSpamhausFeed {
    param (
        [string]$Url,
        [string]$OutputFile
    )

    $client = New-Object System.Net.WebClient
    $client.Headers.Add("User-Agent", "Mozilla/5.0")

    $content = $client.DownloadString($Url)

    $clean = $content -split "`n" |
        ForEach-Object { $_.Trim() } |
        Where-Object {
            $_ -ne "" -and
            -not $_.StartsWith(";")
        } |
        ForEach-Object {
            ($_ -split ";")[0].Trim()
        }

    $clean | Set-Content $OutputFile

    Write-Host "Created $OutputFile"
    Write-Host "Entries: $($clean.Count)"
}

try {
    Get-CleanSpamhausFeed `
        -Url $ipv4Url `
        -OutputFile "spamhaus-unifi.txt"

    Get-CleanSpamhausFeed `
        -Url $ipv6Url `
        -OutputFile "spamhaus-unifi-v6.txt"
}
catch {
    Write-Host "ERROR:"
    Write-Host $_.Exception.Message
    throw
}
