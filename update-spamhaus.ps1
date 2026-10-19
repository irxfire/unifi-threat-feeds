$url = "https://www.spamhaus.org/drop/drop.txt"

$response = Invoke-RestMethod -Uri $url

$clean = $response -split "`n" |
    Where-Object {
        $_ -notmatch '^;' -and $_.Trim() -ne ''
    } |
    ForEach-Object {
        ($_ -split ';')[0].Trim()
    }

$clean | Set-Content "spamhaus-unifi.txt"
