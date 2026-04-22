\# Kali Linux — Attacker/Management VM



\## Role in the Lab

Kali serves as both the primary attacker machine and the management

workstation for accessing pfSense WebGUI and other VM consoles.

IP: 10.0.0.x (LAN segment), accessed pfSense at 10.99.99.1 (ISOLATED).



\## Tools Used in the Lab

\- \*\*nmap\*\* — Network discovery and port scanning against lab targets

\- \*\*Metasploit\*\* — Exploitation of Metasploitable2 and DVWA

\- \*\*Burp Suite\*\* — Web application testing against DVWA

\- \*\*netcat\*\* — Reverse shell handling and port probing

\- \*\*SSH\*\* — Remote management of Ubuntu/Splunk and Wazuh VMs



\## Example Commands Run

```bash

\# Network scan of CYBER\_RANGE segment

nmap -sV -O 10.6.6.0/24



\# Port scan of AD DC

nmap -sV -p 88,135,389,445,636 10.80.80.2

```



\## pfSense Access

pfSense WebGUI was accessed from Kali browser at https://10.99.99.1

Firewall rules were configured per segment — CYBER\_RANGE rules

visible in pfsense.png allow internal traffic and block to RFC1918.

