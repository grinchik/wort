# wort

Personal OpenWrt 24.10 configuration files.

## Key Settings

- 5GHz WiFi only (2.4GHz disabled)
- WPA3 (SAE) encryption only
- Guest network with client isolation, blocked from LAN and private subnets
- IPv6 disabled
- Hardened firewall (default drop, syn flood protection)

## Build

Create a `credentials.mk` file with WiFi credentials:

```
AP_LAN_SSID=MyNetwork
AP_LAN_KEY=MyNetworkPassword
AP_GUEST_SSID=GuestNetwork
AP_GUEST_KEY=GuestNetworkPassword
```

Then run:

```sh
make build
```

Output goes to `build/config/`.

## Deploy

Copy `build/config/` files to `/etc/config/` on the router and reboot it.
