# Run on Domain Controller (or using AD tools from a workstation)
Import-Module ActiveDirectory

# Example groups and users
New-ADGroup -Name 'RedTeam' -GroupScope Global -Path 'CN=Users,DC=lab,DC=local'
New-ADUser -Name 'alice' -GivenName 'Alice' -Surname 'User' -SamAccountName 'alice' -AccountPassword (ConvertTo-SecureString 'UserPass123!' -AsPlainText -Force) -Enabled $true
Add-ADGroupMember -Identity 'RedTeam' -Members 'alice'

New-ADUser -Name 'bob' -GivenName 'Bob' -Surname 'User' -SamAccountName 'bob' -AccountPassword (ConvertTo-SecureString 'UserPass123!' -AsPlainText -Force) -Enabled $true
