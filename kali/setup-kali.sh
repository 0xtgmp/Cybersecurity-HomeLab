# Kali helper setup script (run as root or with sudo)
apt update && apt full-upgrade -y
apt install -y open-vm-tools-desktop linux-headers-$(uname -r) git net-tools ssh
# Example tools
apt install -y nmap netcat- traditional curl
# Enable SSH (optional)
systemctl enable ssh
systemctl start ssh
echo 'Kali setup script finished. Install additional tools as needed.'
