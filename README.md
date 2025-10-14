# Virtual Security Home Lab (based on David Varghese blog series)
This repository contains configuration files, diagrams and setup scripts to reproduce the VirtualBox-based cybersecurity home lab described in:
https://blog.davidvarghese.net/categories/home-lab/

**What's included**
- `diagrams/network.dot` — Graphviz topology (editable).
- `diagrams/network-ascii.txt` — Simple ASCII topology (quick view).
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

**Important**
- These files are a best-effort extraction & automation set created from the public blog series. You must review, test and adapt before using them in your environment.
- Do **not** blindly import `pfsense/config-sample.xml` into a production network — it is meant for an isolated lab only.
