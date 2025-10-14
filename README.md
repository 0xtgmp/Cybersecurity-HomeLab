# Hello, I'm T.g.m.prakash
[![LinkedIn](https://img.shields.io/badge/-LinkedIn-0072b1?&style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/guru-manikanta-prakash-thota-2973951b4)

I am a recent graduate with a profound interest in technology and a dedication to solving complex problems.

## Objective
Motivated by a deep interest in cybersecurity, I have built this home lab to develop advanced practical skills in security operations, incident response, and threat detection. My goal is to leverage these skills and experience to pursue a role as a Security Operations Center (SOC) Tier 1 Analyst.


## Certifications
[![CEH](https://img.shields.io/badge/-CEH-FF0000?&style=for-the-badge&logo=ECCouncil&logoColor=white)](https://drive.google.com/file/d/17TZhmnXuVT2E2z4WE_YXyfgg8SPAdf03/view)

## Overview
This home lab is designed to simulate real-world security environments for red teaming, blue teaming, malware analysis, and DFIR using VirtualBox and a range of open-source tools and operating systems. Inspired by David Varghese’s comprehensive guide, the lab provides hands-on experience with network segmentation, threat detection, monitoring, and incident response.

## Lab Modules & Components
| Step | Component           | Description                                                        |
|------|---------------------|--------------------------------------------------------------------|
| 1    | Network Topology    | Design and visualization of a secure, segmented lab network        |
| 2    | pfSense Setup       | Deployment and configuration of pfSense firewall/router            |
| 3    | Kali Linux Setup    | Installation and setup for penetration testing and attack simulation|
| 4    | pfSense Firewall    | Firewall rules, DHCP, setup via pfSense                            |
| 5    | Cyber Range VMs     | Vulnerable VMs (Metasploitable, DVWA, etc.) for exploit practice   |
| 6-7  | Active Directory    | Windows Server AD/DC/Client, Group Policy, authentication          |
| 8    | Malware Lab         | Dedicated malware analysis VMs (Windows+Linux)                     |
| 9    | DFIR (Tsurugi)      | Tsurugi Linux for forensics and incident response                  |
| 10   | SIEM (Splunk)       | Splunk for log collection and detection dashboards                 |


## Key Tools and Technologies
* VirtualBox: Hypervisor lab environments.

* pfSense: Network firewall, routing.

* Kali Linux: Penetration testing and attack simulation.

* Windows Server/Client: Active Directory, authentication, GPOs.

* Metasploitable/DVWA: Targets for exploitation and vulnerability testing.

* Tsurugi Linux: Digital forensics and incident response toolkit.

* Splunk: Centralized logging, alerting, SIEM Tool.

* Custom scripts/configs: Networking, automation, and threat simulation.

## Learning Outcomes
* Network segmentation and secure topologies in virtualized labs.

* Firewall & Rules,DHCP, DNS setup using pfSense.

* Deploying/red teaming vs. blue teaming VMs.

* Windows domain controller and Group Policy management.

* Malware analysis and safe threat detonation.

* SIEM (Splunk) log collection, dashboarding, and threat detection.

* Digital forensics analysis and data recovery.



## What's Included
- `diagrams/network.dot` — Graphviz topology.
- `diagrams/network-ascii.txt` — Simple ASCII topology.
- `virtualbox/vboxmanage-commands.txt` — VBoxManage commands & VM settings based on the blog.
- `pfsense/config-sample.xml` — *Simplified* sample pfSense config fragment (interfaces, DHCP for LAN/OPT1, OPT2 DHCP disabled).
- `pfsense/web-setup-instructions.md` — GUI steps to finish pfSense configuration safely.
- `ad/setup-domain.ps1` — PowerShell script to promote a Server 2019 VM to a Domain Controller (creates domain `lab.local`).
- `ad/create-users.ps1` — Example script to create AD users and groups for testing.
- `ad/README_AD.md` — Notes and manual steps for AD client join and snapshots.
- `malware/flarevm-install.ps1` — Chocolatey + Winget-based helper script to install common FlareVM tooling (for a dedicated Windows analysis VM).
- `kali/setup-kali.sh` — Kali helper script to install common tools and set SSH for remote control (for management/attacker VM).
- `LICENSE` — CC-BY-NC-SA 4.0 as used by the original blog (please respect original license).
- `LICENSE_NOTES.txt` — Short note about what you must check before importing configs (safety & customization).

## Conclusion
Throughout the process of building and configuring this home lab, whenever an issue arose—whether with firewall rules, network configurations, DHCP, DNS, or Active Directory DNS integration—I dedicated focused effort to deeply understand each problem and identify its root cause. By methodically troubleshooting and researching solutions, I was able to resolve technical challenges and strengthen my expertise in practical network security and infrastructure management. This hands-on, problem-solving mindset is a core part of my learning process and approach as a cybersecurity professional.


## Reference
Tutorials inspired by [David Varghese’s Virtual Security Home Lab Series](https://david-varghese.medium.com/).
- [All parts index](https://blog.davidvarghese.net/categories/home-lab/)
