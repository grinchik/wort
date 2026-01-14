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
	LAN_AP_SSID="$$(cat $(LAN_AP_SSID_FILE_PATH))" \
	LAN_AP_KEY="$$(cat $(LAN_AP_KEY_FILE_PATH))" \
		envsubst \
			< "$<" \
			> "$@" \
		;
