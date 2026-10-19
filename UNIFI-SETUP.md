# UniFi Setup Guide

This guide explains how to use the cleaned Spamhaus DROP feed with UniFi Network Lists.

## Problem

The native Spamhaus DROP feed includes comments and metadata on each line.

Example:

```text
1.10.16.0/20 ; SBL388485
1.19.0.0/16 ; SBL388486
```

Current UniFi Network Lists may only import the first entry from this format.

This repository automatically removes comments and publishes a UniFi-compatible list.

## Step 1: Create a Dynamic Network List

In UniFi Network:

1. Go to **Settings**
2. Select **Policy Engine**
3. Select **Network Lists**
4. Click **Create New List**

Configure:

- Name: Spamhaus IPv4 DROP List
- Type: IPv4
- Source: Dynamic

URL:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

Update Interval:

```text
24 Hours
```

Click **Save**.

## Step 2: Verify Import

Select the new list and click:

```text
Update Now
```

You should see approximately 1,600+ IPv4 network entries imported.

## Step 3: Create a Firewall Rule

Navigate to:

```text
Settings → Policy Engine → Firewall Rules
```

Create a new rule:

### Rule Settings

Action:

```text
Block
```

### Source

```text
Internet
```

### Source Type

```text
IP List
```

### List

```text
Spamhaus IPv4 DROP List
```

### Destination

```text
Any
```

### Protocol

```text
All
```

Enable logging if desired.

Save the rule.

## Result

Traffic originating from networks listed in the Spamhaus DROP feed will be blocked by the UniFi Gateway.

## Feed Information

Source Feed:

https://www.spamhaus.org/drop/drop.txt

Processed Feed:

https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt

## Disclaimer

This repository is not affiliated with Spamhaus or Ubiquiti.

The Spamhaus data remains the property of Spamhaus. This repository only reformats the feed for compatibility with UniFi Network Lists.
