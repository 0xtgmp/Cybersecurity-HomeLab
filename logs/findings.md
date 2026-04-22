Log Analysis — Home Lab Practice

Logs collected across the lab using Splunk SIEM and Wazuh XDR from
multiple monitored endpoints: Linux (Wazuh agent), Windows AD Domain
Controller (SOC-AD1.ad.lab), Kali Linux, and pfSense firewall.

1. CIS Benchmark Scan — Linux (Wazuh)
Source: index=2.5k_logs.csv | Rule IDs: 19004, 19011
Compliance frameworks: PCI-DSS 2.2, NIST 800-53 CM.1, GDPR IV_35.7.d
Wazuh ran a CIS Benchmark scan (Amazon Linux 2023, v1.0.0) on the
monitored Linux endpoint. The system scored 43% — passing 77 out of
183 checks and failing 100. One notable failed check was ensuring the
message of the day (/etc/motd) did not expose OS version details,
mapped to MITRE T1082 (System Information Discovery) and T1592
(Gather Victim Host Information). This confirmed that the default
system configuration leaks information useful to attackers.

2. Privilege Escalation — Linux (Wazuh)
Source: wazuh_logs.csv | Rule IDs: 5402, 5501, 5502
MITRE ATT&CK: T1548.003 — Sudo and Sudo Caching
PAM session events showed user wazuh-user (uid=1000) opening a sudo
session to escalate to root. Commands /usr/bin/bash, /usr/bin/chmod,
and /usr/bin/systemctl were executed as root. The full lifecycle —
session opened (5501), privileged command run (5402), session closed
(5502) — was captured and visible in Splunk.

3. Network Port Changes — Linux (Wazuh)
Source: wazuh_logs.csv | Rule level: 7
Wazuh detected that the listening port status changed on the monitored
Linux host (new port opened). This type of alert is important in
practice because unexpected new listening ports are a common indicator
of malware establishing a backdoor or C2 channel.

4. AppArmor & SELinux Policy Events — Linux (Wazuh)
Source: wazuh_logs.csv | Rule IDs: 80736, 52002
Auditd SELinux permission checks and an AppArmor DENIED event were
captured. The AppArmor denial indicates a process attempted an action
outside its security profile. Monitoring these events is part of
verifying that mandatory access controls are functioning correctly.

5. Windows Failed Logons — Active Directory
Source: win_failed_logon.csv | Event ID: 4625 (678 events)
Host: SOC-AD1.ad.lab | Domain: AD
MITRE ATT&CK: T1110 — Brute Force
678 failed logon attempts were captured against the Windows AD domain
controller. Events targeted the account ThotaGMP with failure reason
"Unknown user name or bad password" (Status: 0xC000006D, Sub-status:
0xC000006A). Logon Type 7 (unlock) and process svchost.exe were
consistently logged. These events were ingested into Splunk and used
to practice building a failed logon detection alert.

6. Windows Successful Logons — Active Directory
Source: windows_successful_logons.csv | Event ID: 4624 (197,868 events)
Authentication: Kerberos, Logon Type 3 (Network)
Successful logon events were collected from the domain controller,
authenticated via Kerberos from source addresses including 10.80.80.2.
These were cross-referenced with the failed logon dataset (Event 4625)
in Splunk to identify patterns where repeated failures preceded a
successful logon — a common indicator of a successful brute-force
attempt.

7. Windows System & Security Events
Source: windows_logs.csv | 158,135 events
Event IDs observed: 7036 (Service state changes), 4624, 4625, and others
General Windows system and security logs from SOC-AD1. Service start
and stop events (Event 7036) were collected for services including
netprofm and UmRdpService. These provide baseline visibility into
normal system behaviour, which is essential for anomaly detection.

8. pfSense Firewall Logs
Source: pfsense_logs.csv | 4,826 events
Host: 10.0.0.1 | Interface: em0
pfSense filterlog captured blocked inbound traffic on interface em0.
IGMP packets from 192.168.1.1 to 224.0.0.1 were consistently blocked
(ip-option block rule). Logs confirm the firewall is enforcing a
default-deny posture and that network segmentation between lab zones
is functioning as intended.

9. Kali Linux System Logs
Source: linux_logs_5k.csv | 9,973 events
Host: kali | Sources: lightdm, Xorg logs
LightDM display manager session lifecycle events were captured — session
start, X server launch, and clean termination (return value 0). These
logs provided practice with Linux syslog ingestion and sourcetype
configuration in Splunk.

Summary
Log SourceEventsKey Practice AreaWazuh (index_2.5k)4,188CIS compliance, SIEM alertingWazuh alerts178Privilege escalation, PAM, AppArmorWindows failed logons678Brute force detection, Event ID 4625Windows successful logons197,868Kerberos auth, baseline monitoringWindows general logs158,135Service events, AD visibilitypfSense firewall4,826Network segmentation, default-denyKali Linux logs9,973Syslog ingestion, sourcetype config
All activity was performed in an isolated virtual lab environment
built for learning and security practice.