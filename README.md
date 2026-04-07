# wort

Personal OpenWrt 25.12 configuration files.

## Key Settings

- LAN via ethernet only
- 5GHz WiFi only (2.4GHz disabled)
- WPA3 (SAE) encryption only
- WiFi network with client isolation, blocked from LAN and private subnets
- IPv6 disabled
- Hardened firewall (default drop, syn flood protection)

## Build

Create a `credentials.mk` file:

```
ROUTER_IP=192.168.1.1
ROOT_PASSWORD=MyRootPassword
SSH_PUBLIC_KEY_FILEPATH=/home/username/.ssh/id_ed25519.pub
AP_COUNTRY=LT
AP_SSID=MyNetworkName
AP_KEY=MyNetworkPassword
```

Then run:

```sh
make build
```

Output goes to `build/config/`.

## Init

First-time setup on a fresh install. Uploads the SSH public key, sets the root password, then deploys configs:

```sh
make init
```

## Deploy

Uploads configs to the router and reboots it:

```sh
make deploy
```
