# Active Directory Notes & Manual Steps

- After running setup-domain.ps1 the server will reboot and AD DS will finish configuration.
- On AD clients set static IPs (or configure DHCP scope on DC) pointing DNS to 10.80.80.2
- Join client to domain: System > About > Join a domain (lab.local) or use PowerShell:
    Add-Computer -DomainName lab.local -Restart -Credential (Get-Credential)
- Snapshot the VMs after a successful AD setup (useful before evaluation expires).
