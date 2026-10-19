# UniFi Threat Feeds

This repository automatically downloads, normalizes, and publishes the Spamhaus DROP lists for use with UniFi Dynamic Network Lists.

The resulting feeds are automatically updated daily and formatted specifically for UniFi compatibility.

---

# Problem Solved

When using the native Spamhaus DROP feeds directly in UniFi Dynamic Network Lists, UniFi may only import the first network entry due to the comments and metadata included in the source files.

Example source format:

```text
1.10.16.0/20 ; SBL388485
1.19.0.0/16 ; SBL388486
```

This repository automatically removes comments and metadata and publishes UniFi-compatible feeds containing only CIDR networks.

Result:

```text
1.10.16.0/20
1.19.0.0/16
```

---

# Current Status

- Source: Spamhaus DROP Lists
- Feed Types:
  - IPv4 CIDR Networks
  - IPv6 CIDR Networks
- Update Frequency: Daily
- Automation Platform: GitHub Actions
- Output Format: UniFi Dynamic Network List Compatible

---

# Purpose

The native Spamhaus DROP feeds contain comments and metadata that UniFi Network Lists do not properly parse.

This workflow normalizes the feeds into plain-text lists of CIDR networks that can be consumed directly by UniFi gateways.

---

# Source Feeds

## IPv4

https://www.spamhaus.org/drop/drop.txt

## IPv6

https://www.spamhaus.org/drop/dropv6.txt

---

# Output Feeds

## IPv4 Feed

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

## IPv6 Feed

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi-v6.txt
```

---

# Quick Start

### Create an IPv4 Dynamic Network List

Use:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

### Create an IPv6 Dynamic Network List

Use:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi-v6.txt
```

### Recommended Update Interval

```text
24 Hours
```

For a complete walkthrough, see:

- UNIFI-SETUP.md

---

# How It Works

A GitHub Actions workflow runs daily and:

1. Downloads the latest Spamhaus IPv4 DROP list
2. Downloads the latest Spamhaus IPv6 DROP list
3. Removes comments and metadata
4. Extracts CIDR networks only
5. Generates UniFi-compatible feeds
6. Publishes the cleaned feeds to this repository
7. Makes the feeds available for UniFi Dynamic Network Lists

---

# Why Use These Feeds?

The Spamhaus DROP lists contain networks identified by Spamhaus as highly malicious and suitable for perimeter-level blocking.

Using these feeds with UniFi allows known malicious networks to be blocked before they can interact with internal resources.

Benefits include:

- Reduced exposure to known malicious infrastructure
- Automated daily updates
- Native integration with UniFi Dynamic Network Lists
- Support for both IPv4 and IPv6

---

# Repository Contents

| File | Purpose |
|--------|---------|
| `spamhaus-unifi.txt` | UniFi-compatible IPv4 network list |
| `spamhaus-unifi-v6.txt` | UniFi-compatible IPv6 network list |
| `update-spamhaus.ps1` | Feed processing script |
| `.github/workflows/update.yml` | Automated update workflow |
| `UNIFI-SETUP.md` | UniFi configuration guide |
| `README.md` | Project overview and documentation |

---

# UniFi Configuration

Create Dynamic Network Lists using the URLs below:

## IPv4

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

## IPv6

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi-v6.txt
```

Recommended Update Interval:

```text
24 Hours
```

Detailed instructions are available in:

- UNIFI-SETUP.md

---

# Example Output

## IPv4

```text
1.10.16.0/20
1.19.0.0/16
1.32.128.0/18
2.26.75.0/24
```

## IPv6

```text
2a0b:b580::/29
2a0c:9a40::/29
2a10:5dc0::/29
```

---

# Technologies Used

- GitHub Actions
- PowerShell
- UniFi Network Lists
- Spamhaus DROP Lists

---

# Documentation

Additional documentation:

- UNIFI-SETUP.md

---

# Disclaimer

This repository is not affiliated with Spamhaus or Ubiquiti.

Spamhaus remains the source and owner of the underlying threat intelligence data. This repository only republishes a reformatted version intended for UniFi compatibility and firewall consumption.

Users are responsible for reviewing and validating any security controls implemented using these feeds.

---

# Acknowledgements

- Spamhaus for maintaining the DROP lists
- Ubiquiti for UniFi Dynamic Network Lists
- The home lab and network security communities for continual knowledge sharing and innovation
