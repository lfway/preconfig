cp /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.orig
cp /etc/network/interfaces   /etc/network/interfaces.orig
cp /etc/dhcp/dhcpd.conf      /etc/dhcp/dhcpd.conf.orig
cp /etc/default/hostapd      /etc/default/hostapd.orig


echo -n "" > /etc/hostapd/hostapd.conf
echo -n "" > /etc/network/interfaces
echo -n "" > /etc/dhcp/dhcpd.conf
echo -n "" > /etc/default/hostapd


echo "interface=wlan0"           >> /etc/hostapd/hostapd.conf
echo "driver=nl80211"            >> /etc/hostapd/hostapd.conf
echo "ssid=LesorubWiFi"          >> /etc/hostapd/hostapd.conf
echo "channel=6"                 >> /etc/hostapd/hostapd.conf
echo "wmm_enabled=1"             >> /etc/hostapd/hostapd.conf
echo "wpa=1"                     >> /etc/hostapd/hostapd.conf
echo "wpa_passphrase=0000000000" >> /etc/hostapd/hostapd.conf
echo "wpa_key_mgmt=WPA-PSK"      >> /etc/hostapd/hostapd.conf
echo "wpa_pairwise=TKIP"         >> /etc/hostapd/hostapd.conf
echo "rsn_pairwise=CCMP"         >> /etc/hostapd/hostapd.conf
echo "auth_algs=1"               >> /etc/hostapd/hostapd.conf
echo "macaddr_acl=0"             >> /etc/hostapd/hostapd.conf


echo "source-directory /etc/network/interfaces.d"          >> /etc/network/interfaces
echo ""                                                    >> /etc/network/interfaces
echo "auto lo"                                             >> /etc/network/interfaces
echo "iface lo inet loopback"                              >> /etc/network/interfaces
echo ""                                                    >> /etc/network/interfaces
echo "iface eth0 inet manual"                              >> /etc/network/interfaces
echo ""                                                    >> /etc/network/interfaces
echo "allow-hotplug wlan0"                                 >> /etc/network/interfaces
echo "iface wlan0 inet static"                             >> /etc/network/interfaces
echo "    address 10.10.0.1"                               >> /etc/network/interfaces
echo "    netmask 255.255.255.0"                           >> /etc/network/interfaces
echo ""                                                    >> /etc/network/interfaces
echo "allow-hotplug wlan1"                                 >> /etc/network/interfaces
echo "iface wlan1 inet manual"                             >> /etc/network/interfaces
echo "    wpa-conf /etc/wpa_supplicant/wpa_supplicant.con" >> /etc/network/interfaces


echo "ddns-update-style none;"                                      >> /etc/dhcp/dhcpd.conf
echo "option domain-name \"example.org\";"                          >> /etc/dhcp/dhcpd.conf
echo "option domain-name-servers ns1.example.org, ns2.example.org;" >> /etc/dhcp/dhcpd.conf
echo "default-lease-time 600;"                                      >> /etc/dhcp/dhcpd.conf
echo "max-lease-time 7200;"                                         >> /etc/dhcp/dhcpd.conf
echo "authoritative;"                                               >> /etc/dhcp/dhcpd.conf
echo "log-facility local7;"                                         >> /etc/dhcp/dhcpd.conf
echo ""                                                             >> /etc/dhcp/dhcpd.conf
echo "subnet 10.10.0.0 netmask 255.255.255.0 {"                     >> /etc/dhcp/dhcpd.conf
echo "    range 10.10.0.25 10.10.0.50;"                             >> /etc/dhcp/dhcpd.conf
echo "    option domain-name-servers 8.8.8.8, 8.8.4.4;"             >> /etc/dhcp/dhcpd.conf
echo "    option routers 10.10.0.1;"                                >> /etc/dhcp/dhcpd.conf
echo "    interface wlan0;"                                         >> /etc/dhcp/dhcpd.conf
echo "}"                                                            >> /etc/dhcp/dhcpd.conf


echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\""   >> /etc/default/hostapd
