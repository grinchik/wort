include credentials.mk

.PHONY: init
init: \
	#
	scp \
		-O \
		"$(SSH_PUBLIC_KEY_FILEPATH)" \
		"root@$(ROUTER_IP):/etc/dropbear/authorized_keys" \
		;

	ssh \
		"root@$(ROUTER_IP)" \
		"echo -e '$(ROOT_PASSWORD)\n$(ROOT_PASSWORD)' | passwd root" \
		;

	$(MAKE) deploy;

.PHONY: deploy
deploy: \
	build \
	#
	scp \
		-O \
		build/config/dhcp \
		build/config/dropbear \
		build/config/firewall \
		build/config/network \
		build/config/system \
		build/config/wireless \
		"root@$(ROUTER_IP):/etc/config/" \
		;

	ssh \
		"root@$(ROUTER_IP)" \
		reboot \
		;

.PHONY: clean
clean: \
	#
	rm -rf build

.PHONY: build
build: \
	build/config/dhcp \
	build/config/dropbear \
	build/config/firewall \
	build/config/network \
	build/config/system \
	build/config/wireless \
	#

build/config: \
	#
	mkdir -p "$@";

build/config/dhcp: \
	src/config/dhcp.template \
	| build/config \
	#
	cp \
		"$<" \
		"$@" \
		;

build/config/dropbear: \
	src/config/dropbear.template \
	| build/config \
	#
	cp \
		"$<" \
		"$@" \
		;

build/config/firewall: \
	src/config/firewall.template \
	| build/config \
	#
	cp \
		"$<" \
		"$@" \
		;

build/config/network: \
	src/config/network.template \
	| build/config \
	#
	cp \
		"$<" \
		"$@" \
		;

build/config/system: \
	src/config/system.template \
	| build/config \
	#
	cp \
		"$<" \
		"$@" \
		;

build/config/wireless: \
	src/config/wireless.template \
	| build/config \
	#
	AP_COUNTRY="$(AP_COUNTRY)" \
	AP_LAN_SSID="$(AP_LAN_SSID)" \
	AP_LAN_KEY="$(AP_LAN_KEY)" \
	AP_GUEST_SSID="$(AP_GUEST_SSID)" \
	AP_GUEST_KEY="$(AP_GUEST_KEY)" \
		envsubst \
			< "$<" \
			> "$@" \
		;
