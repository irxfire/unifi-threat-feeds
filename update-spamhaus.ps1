$url = "https://www.spamhaus.org/drop/drop.txt"

$content = (Invoke-WebRequest $url).Content

$clean = $content -split "`n" |
    Where-Object {
        $_ -notmatch '^;' -and $_.Trim() -ne ''
    } |
    ForEach-Object {
        ($_ -split ';')[0].Trim()
    }

$clean | Set-Content spamhaus-unifi.txt
