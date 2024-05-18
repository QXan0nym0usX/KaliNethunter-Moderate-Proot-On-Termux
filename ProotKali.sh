#!/bin/bash

spinner()
{
    local pid=$1
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

echo "Updating and upgrading Termux packages"
sleep 2
pkg update && pkg upgrade -y

echo "Installing packages Termux"
sleep 2
pkg i -y x11-repo && pkg i -y zsh proot-distro pulseaudio termux-x11-nightly && pkg install wget git proot axel angle-android virglrenderer-android

#####################################################################################
echo "Downloading some things"
cd $HOME
mkdir -p AutomaticInstall
cd AutomaticInstall

wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/default.pa \
&& wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/proot-distro \
&& wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/termux.properties &

sleep 5

echo "Replace existing files with new ones"

rm -rf $PREFIX/etc/pulse/default.pa
mv $HOME/AutomaticInstall/default.pa $PREFIX/etc/pulse/default.pa
sleep 2

rm -rf $PREFIX/bin/proot-distro
mv $HOME/AutomaticInstall/proot-distro $PREFIX/bin/proot-distro
chmod +x $PREFIX/bin/proot-distro  # Ensure the new file is executable
sleep 1

rm -rf $HOME/.termux/termux.properties
mv $HOME/AutomaticInstall/termux.properties $HOME/.termux/termux.properties
sleep 2

#Remove AutomaticInstall folder

cd $HOME

rm -rf $HOME/AutomaticInstall

########################################################################################

# If zsh doesn't work, the problem is probably your termux
echo "Installing my zsh"
cd $HOME
wget -q  https://github.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/raw/main/AutomaticInstall/myzsh.tar.xz
tar -xvJf myzsh.tar.xz && mv ~/zsh/.* ~/
rm -rf ~/zsh
chsh -s zsh
rm -rf $HOME/myzsh.tar.xz
sleep 4

echo -n "Wait... "

cd $PREFIX/etc/proot-distro/
sleep 2

rm -f kali.sh
sleep 2

wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/kali.sh
sleep 2

cd $HOME
sleep 2

# Download kali to a temporary location
TEMP_KALI=$HOME/kali
wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/kali -O $TEMP_KALI
sleep 2
chmod +x $TEMP_KALI

# Move to the final destination
mv $TEMP_KALI $PREFIX/bin/kali
sleep 1

# Check if the file exists before restoring
if [ ! -f "/sdcard/Download/kali.tar.xz" ]; then
    echo -e "\033[0;31mError: File '/sdcard/Download/kali.tar.xz' not found.\033[0m"
    exit 1
fi

# Extract Kali tar.xz to the target directory with spinner animation
echo -n "Extracting Kali... "
(tar -xvf /sdcard/Download/kali.tar.xz -C /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs > /dev/null 2>&1) &
spinner $!
wait

echo -e "\033[0;32mDone\033[0m"
sleep 3

echo -e "\033[0;32mYou can now log in with kali\033[0m"
sleep 3

echo -e "\033[0;32mUse the command kali, and kali -r with root without password\033[0m"
sleep 3
