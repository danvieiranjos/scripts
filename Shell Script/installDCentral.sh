#!/usr/bin/env bash
# Install the Desktop Central on Linux.
# 
# Criado por Danilo Vieira
# Dependencies: unzip, cut, tar, gzip
#
# The version Agent will be installed by default in "/usr/local/desktopcentralagent" directory.
#set -o errexit
echo "Starting installation."
DISTRO=$(cat /etc/issue /etc/system-release /etc/redhat-release /etc/os-release 2>/dev/null | grep -m 1 -Eo "(Ubuntu|Amazon|CentOS|Debian|Red Hat|SUSE)" || true)
IS_UNZIP_INSTALLED=$(which unzip | wc -l)
if [ $IS_UNZIP_INSTALLED -eq 0 ]; then
    echo "unzip is required to install, please confirm Y/N to install (default Y): "
    read -r CONFIRM_UNZIP
    if [ "$CONFIRM_UNZIP" == "Y" ] || [ "$CONFIRM_UNZIP" == "y" ] || [ "$CONFIRM_UNZIP" == "" ]; then
        if [ "$DISTRO" == "Ubuntu" ] || [ "$DISTRO" == "Debian" ]; then
            sudo apt-get update
            sudo apt-get install unzip -y
		elif [ "$DISTRO" == "Amazon" ] || [ "$DISTRO" == "CentOS" ] || [ "$DISTRO" == "Red Hat" ]; then
            sudo yum install unzip -y
        elif [ "$DISTRO" == "SUSE" ]; then
            sudo zypper -n install unzip
        else
            echo "Unable to continue. Please install unzip manually before proceeding."; exit 131
        fi
    else
        echo "Unable to continue without unzip. Please install unzip before proceeding."; exit 131
    fi
fi
# Baixar arquivo
echo "Download"
cd /tmp && wget https://empresa.com/downloads/LinuxDCentral.zip
unzip LinuxDCentral.zip
# Install Exec
sudo chmod +x DesktopCentral_LinuxAgent.bin
sudo ./DesktopCentral_LinuxAgent.bin

rm /tmp/*.bin
rm /tmp/*.zip
rm /tmp/LINUX_README.html
rm /tmp/serverinfo.json