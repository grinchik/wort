# wort

Personal OpenWrt 24.10 configuration files.

## Key Settings

- 5GHz WiFi only (2.4GHz disabled)
- WPA3 (SAE) encryption only
- Guest network with client isolation, blocked from LAN and private subnets
- IPv6 disabled
- Hardened firewall (default drop, syn flood protection)

## Build

WiFi credentials are substituted from files at build time:

```sh
make build \
  AP_LAN_SSID_FILE_PATH=AP_LAN_SSID.txt \
  AP_LAN_KEY_FILE_PATH=AP_LAN_KEY.txt \
  AP_GUEST_SSID_FILE_PATH=AP_GUEST_SSID.txt \
  AP_GUEST_KEY_FILE_PATH=AP_GUEST_KEY.txt
```

Output goes to `build/config/`.

## Deploy

Copy `build/config/` files to `/etc/config/` on the router and reboot it.
