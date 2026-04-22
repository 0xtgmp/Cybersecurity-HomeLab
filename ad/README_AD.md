\# Active Directory Lab — Notes



\## Domain Details

\- Domain: lab.local | NetBIOS: LAB

\- Domain Controller IP: 10.80.80.2 (static)

\- Network segment: OPT2 (10.80.80.0/24) on pfSense



\## Setup Steps

1\. Ran setup-domain.ps1 as Administrator — installed AD DS role,

&#x20;  configured static IP, promoted server to DC, created domain lab.local

2\. Server rebooted automatically after AD DS promotion

3\. Ran create-users.ps1 — created RedTeam group, users alice and bob

4\. Joined Windows 10 clients to lab.local via:

&#x20;  Add-Computer -DomainName lab.local -Restart -Credential (Get-Credential)

5\. Set client DNS to 10.80.80.2 (DC is authoritative DNS for lab.local)

6\. Snapshotted all VMs after successful domain join



\## What I Practiced

\- Deploying a Windows Server 2019 Domain Controller from scratch

\- Active Directory user and group management via PowerShell

\- Domain join of Windows 10 clients

\- DNS integration between pfSense and AD DC

\- Group Policy was configured on the DC for password policies and logon auditing

&#x20; (which generated the Event ID 4624/4625 events visible in Splunk logs)



\## Issues Encountered

\- AD clients couldn't resolve lab.local initially — fixed by pointing

&#x20; client DNS to DC IP (10.80.80.2) instead of pfSense (10.80.80.1)

\- Static IP configuration on the server had to be done before

&#x20; AD DS promotion or DNS registration would fail

