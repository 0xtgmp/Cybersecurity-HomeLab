# pfSense Web UI quick steps (based on blog)

1. Boot pfSense first. WAN will get an IP from VirtualBox NAT. LAN, OPT1, OPT2 should be static as below.
2. LAN: 10.0.0.1/24 — enable DHCP range 10.0.0.11-10.0.0.243
3. OPT1: 10.6.6.1/24 — enable DHCP range 10.6.6.11-10.6.6.243 (Cyber Range)
4. OPT2: 10.80.80.1/24 — **DHCP disabled**. AD DC will provide DHCP and DNS for OPT2.
5. Web UI: https://<LAN IP> (accept self-signed cert). Login with admin credentials set during install.
6. Firewall rules: create minimal outbound allow rules per interface; create rules allowing traffic from one interface to wan and blocking traffic between interfaces as required.
7. NAT: leave default outbound NAT (automatic) unless you want static NAT behavior.
8. Back up config after finishing: Diagnostics -> Backup/Restore -> Download config.xml

## Additional Interfaces (actual lab)
5. OPT3/ISOLATED: 10.99.99.1/24 — DHCP 10.99.99.11-243
   (Splunk SIEM and Tsurugi DFIR live here)
6. OPT4/SECURITY: 10.10.10.1/24 — DHCP 10.10.10.11-243
   (Wazuh XDR agent network)

## Firewall Rules Configured (per interface)
- **CYBER_RANGE:** Allow internal traffic, allow to Kali (10.0.0.2),
  allow to non-RFC1918 addresses, block everything else
- **AD_LAB:** Allow traffic to DC (10.80.80.2) on AD ports (88, 389, 445, 636)
- **ISOLATED:** Allow Splunk (UDP 514, TCP 9997) and Wazuh (1514, 1515)
- **WAN:** Default block inbound, NAT outbound automatic

## Splunk Log Forwarding
Configured Splunk Universal Forwarder on Windows DC to forward
WinEventLog:Security and WinEventLog:System to Splunk at 10.99.99.x:9997
pfSense syslog forwarded to Splunk via UDP 514