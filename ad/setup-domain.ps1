# PowerShell script (run as Administrator on the Windows Server 2019 VM)
# Set static IP and promote to Domain Controller for domain: lab.local
# NOTE: Edit interface name, IPs and safe credentials before running.
$iface = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Select-Object -First 1
Write-Host "Configuring IPv4 on $($iface.Name)..."
New-NetIPAddress -InterfaceIndex $iface.ifIndex -IPAddress 10.80.80.2 -PrefixLength 24 -DefaultGateway 10.80.80.1
Set-DnsClientServerAddress -InterfaceIndex $iface.ifIndex -ServerAddresses 10.80.80.2

# Install AD DS role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Provide safe secure password (change this)
$securePwd = ConvertTo-SecureString 'P@ssw0rd!ChangeMe' -AsPlainText -Force
Install-ADDSForest -DomainName "lab.local" -SafeModeAdministratorPassword $securePwd -DomainNetbiosName "LAB" -InstallDNS -Force
