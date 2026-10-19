# UniFi Threat Feeds

This repository automatically downloads, cleans, and publishes the Spamhaus DROP list for use with UniFi Dynamic Network Lists.

## Purpose

The native Spamhaus DROP feed contains comments and metadata that UniFi Network Lists do not properly parse. This workflow normalizes the feed into a plain-text list of CIDR networks that can be consumed directly by UniFi gateways.

## Source Feed

Spamhaus DROP List:

https://www.spamhaus.org/drop/drop.txt

## Output Feed

IPv4 Feed:

https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt

## How It Works

A GitHub Actions workflow runs daily and:

1. Downloads the latest Spamhaus DROP list
2. Removes comments and metadata
3. Extracts CIDR networks only
4. Publishes the cleaned list to this repository
5. Makes the list available for UniFi Dynamic Network Lists

## UniFi Configuration

Create a new Dynamic IPv4 Network List and use:

https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt

Recommended update interval:

- Every 24 hours

## Example Output

```text
1.10.16.0/20
1.19.0.0/16
1.32.128.0/18
2.26.75.0/24
```

## Disclaimer

This repository is not affiliated with Spamhaus or Ubiquiti.

Threat intelligence data remains the property of Spamhaus and is redistributed here only in a normalized format for firewall consumption.

## Technologies Used

- GitHub Actions
- PowerShell
- UniFi Network Lists
- Spamhaus DROP Feed

## Documentation

- [UniFi Setup Guide](./UNIFI-SETUP.md)

## Quick Start

Use the following URL in a UniFi Dynamic IPv4 Network List:

https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
