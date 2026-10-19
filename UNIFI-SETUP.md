# UniFi Setup Guide

This guide explains how to configure UniFi Dynamic Network Lists using the processed Spamhaus DROP feeds provided by this repository.

---

# Overview

The feeds in this repository are automatically updated daily and formatted specifically for UniFi compatibility.

Available feeds:

## IPv4

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

## IPv6

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi-v6.txt
```

---

# Requirements

- UniFi Network application with support for Dynamic Network Lists
- UniFi Gateway (UDM Pro, UDM Pro Max, UDM SE, UXG, etc.)
- Internet connectivity from the UniFi Gateway
- UniFi administrator access

---

# Configure the IPv4 Network List

## Step 1

Open the UniFi Network application.

Navigate to:

```text
Settings
  └─ Policy Engine
       └─ Network Lists
```

Click:

```text
Create New List
```

---

## Step 2

Configure the list.

### Name

```text
Spamhaus IPv4 DROP List
```

### Type

```text
IPv4
```

### Source

```text
Dynamic
```

### URL

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

### Update Interval

```text
24 Hours
```

Click:

```text
Save
```

---

## Step 3

Select the newly created list and click:

```text
Update Now
```

After synchronization, verify that the list contains approximately:

```text
1,600+ entries
```

The exact number will vary as Spamhaus updates the feed.

---

# Configure the IPv6 Network List

## Step 1

Navigate to:

```text
Settings
  └─ Policy Engine
       └─ Network Lists
```

Click:

```text
Create New List
```

---

## Step 2

Configure the list.

### Name

```text
Spamhaus IPv6 DROP List
```

### Type

```text
IPv6
```

### Source

```text
Dynamic
```

### URL

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi-v6.txt
```

### Update Interval

```text
24 Hours
```

Click:

```text
Save
```

---

## Step 3

Select the newly created list and click:

```text
Update Now
```

You should see approximately:

```text
90+ entries
```

The exact number will vary as Spamhaus updates the feed.

---

# Create the IPv4 Firewall Rule

Navigate to:

```text
Settings
  └─ Policy Engine
       └─ Firewall Rules
```

Click:

```text
Create Rule
```

---

## General Settings

### Name

```text
Block Spamhaus IPv4
```

### Action

```text
Block
```

### Enable Logging

Optional but recommended.

---

## Source Settings

### Traffic From

```text
Internet
```

### Source Type

```text
IP List
```

### Source List

```text
Spamhaus IPv4 DROP List
```

---

## Destination Settings

```text
Any
```

---

## Protocol

```text
All
```

Save the rule.

---

# Create the IPv6 Firewall Rule

If IPv6 is enabled on your network, create a corresponding IPv6 rule.

### Name

```text
Block Spamhaus IPv6
```

### Action

```text
Block
```

### Traffic From

```text
Internet
```

### Source Type

```text
IP List
```

### Source List

```text
Spamhaus IPv6 DROP List
```

### Destination

```text
Any
```

### Protocol

```text
All
```

Save the rule.

---

# Verification

After creating the lists and firewall rules:

1. Confirm the Network Lists successfully update.
2. Verify the entry counts are populated.
3. Confirm the firewall rules are enabled.
4. Optionally enable logging on the rules and review UniFi logs for blocked traffic.

---

# Troubleshooting

## Only One Entry Is Imported

This typically occurs when UniFi is pointed directly at the native Spamhaus feed:

```text
https://www.spamhaus.org/drop/drop.txt
```

Use the processed feed from this repository instead:

```text
https://raw.githubusercontent.com/irxfire/unifi-threat-feeds/main/spamhaus-unifi.txt
```

---

## Network List Does Not Update

Verify:

- The URL is correct
- The gateway has Internet access
- DNS resolution is working
- GitHub is reachable from the gateway

Try:

```text
Update Now
```

to force a refresh.

---

## Firewall Rule Is Not Blocking Traffic

Verify:

- The rule is enabled
- The correct Network List is selected
- The rule is positioned appropriately within the firewall policy order
- Logging is enabled for troubleshooting

---

# Feed Maintenance

No maintenance is required.

This repository automatically:

1. Downloads the latest Spamhaus DROP feeds
2. Removes comments and metadata
3. Generates UniFi-compatible lists
4. Publishes updated feeds daily via GitHub Actions

---

# Disclaimer

This repository is not affiliated with Spamhaus or Ubiquiti.

Spamhaus remains the owner and maintainer of the underlying threat intelligence data. This repository only reformats the data to improve compatibility with UniFi Dynamic Network Lists.
