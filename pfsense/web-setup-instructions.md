# pfSense Web UI quick steps (based on blog)

1. Boot pfSense first. WAN will get an IP from VirtualBox NAT. LAN, OPT1, OPT2 should be static as below.
2. LAN: 10.0.0.1/24 — enable DHCP range 10.0.0.11-10.0.0.243
3. OPT1: 10.6.6.1/24 — enable DHCP range 10.6.6.11-10.6.6.243 (Cyber Range)
4. OPT2: 10.80.80.1/24 — **DHCP disabled**. AD DC will provide DHCP and DNS for OPT2.
5. Web UI: https://<LAN IP> (accept self-signed cert). Login with admin credentials set during install.
6. Firewall rules: create minimal outbound allow rules per interface; create rules allowing OPT2->AD DC traffic (DNS, Kerberos, LDAP) as required.
7. NAT: leave default outbound NAT (automatic) unless you want static NAT behavior.
8. Back up config after finishing: Diagnostics -> Backup/Restore -> Download config.xml
