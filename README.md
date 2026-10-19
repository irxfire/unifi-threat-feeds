# UniFi Threat Feeds

This repository automatically downloads, normalizes, and publishes the Spamhaus DROP list for use with UniFi Dynamic Network Lists.

The resulting feed is automatically updated daily and formatted specifically for UniFi compatibility.

---

# Problem Solved

When using the native Spamhaus DROP feed directly in UniFi Dynamic Network Lists, UniFi may import only the first network entry due to the comments and metadata included in the source file.

Example source format:

```text
1.10.16.0/20 ; SBL388485
1.19.0.0/16 ; SBL388486
```

This repository automatically removes comments and metadata and publishes a UniFi-compatible feed containing only CIDR networks.

Result:

```text
1.10.16.0/20
1.19.0.0/16
```

---

# Current Status

- Source: Spamhaus DROP List
- Feed Type: IPv4 CIDR Networks
- Update Frequency: Daily
- Automation Platform: GitHub Actions
- Output Format: UniFi Dynamic Network List Compatible

---

# Purpose

The native Spamhaus DROP feed contains comments and metadata that UniFi Network Lists do not properly parse.

This workflow normalizes the feed into a plain-text list of CIDR networks that can be consumed directly by UniFi gateways.

---

# Source Feed

Spamhaus DROP List:

https://www.spamhaus.org/drop/drop.txt

---

# Output Feed

UniFi-Compatible IPv4 Feed:

https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt

---

# Quick Start

Create a Dynamic IPv4 Network List in UniFi and use:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

Recommended Update Interval:

```text
24 Hours
```

See [UNIFI-SETUP.md](UNIFI-SETUP.md) for detailed configuration instructions.

---

# How It Works

A GitHub Actions workflow runs daily and:

1. Downloads the latest Spamhaus DROP list
2. Removes comments and metadata
3. Extracts CIDR networks only
4. Generates a UniFi-compatible feed
5. Publishes the cleaned list to this repository
6. Makes the list available for UniFi Dynamic Network Lists

---

# Why Use This Feed?

The Spamhaus DROP list contains networks identified by Spamhaus as highly malicious and suitable for perimeter-level blocking.

Using this feed with UniFi allows known malicious networks to be blocked before they can interact with internal resources.

---

# Repository Contents

| File | Purpose |
|--------|---------|
| `spamhaus-unifi.txt` | UniFi-compatible IPv4 network list |
| `update-spamhaus.ps1` | Feed processing script |
| `.github/workflows/update.yml` | Automated update workflow |
| `UNIFI-SETUP.md` | UniFi configuration guide |
| `README.md` | Project overview and documentation |

---

# UniFi Configuration

Create a new Dynamic IPv4 Network List and use:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

Recommended Update Interval:

```text
24 Hours
```

Detailed instructions are available in:

- [UNIFI-SETUP.md](UNIFI-SETUP.md)

---

# Example Output

```text
1.10.16.0/20
1.19.0.0/16
1.32.128.0/18
2.26.75.0/24
```

---

# Technologies Used

- GitHub Actions
- PowerShell
- UniFi Network Lists
- Spamhaus DROP Feed

---

# Documentation

Additional documentation:

- [UNIFI-SETUP.md](UNIFI-SETUP.md)

---

# Disclaimer

This repository is not affiliated with Spamhaus or Ubiquiti.

Spamhaus remains the source and owner of the underlying threat intelligence data. This repository only republishes a reformatted version intended for UniFi compatibility and firewall consumption.

---

# Acknowledgements

- Spamhaus for maintaining the DROP feed
- Ubiquiti for UniFi Dynamic Network Lists
- The home lab and network security community for sharing configurations and ideas
