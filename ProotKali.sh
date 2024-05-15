#!/bin/bash

echo "Updating and upgrade Termux packages "
sleep 2
pkg update && pkg upgrade -y

echo "Installing packages Termux"
sleep 2
pkg up -y && pkg i -y x11-repo && pkg i -y zsh proot-distro pulseaudio termux-x11-nightly && pkg install wget git proot axel angle-android virglrenderer-android

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

if [ -f "$HOME/AutomaticInstall/default.pa" ]; then
    rm -f $PREFIX/etc/pulse/default.pa
    mv $HOME/AutomaticInstall/default.pa $PREFIX/etc/pulse/default.pa
fi

if [ -f "$HOME/AutomaticInstall/proot-distro" ]; then
    rm -f $PREFIX/bin/proot-distro
    mv $HOME/AutomaticInstall/proot-distro $PREFIX/bin/proot-distro
    chmod +x $PREFIX/bin/proot-distro  #Ensure it is executable
fi

if [ -f "$HOME/AutomaticInstall/termux.properties" ]; then
    rm -f $HOME/.termux/termux.properties
    mv $HOME/AutomaticInstall/termux.properties $HOME/.termux/termux.properties
fi

#Remove AutomaticInstall folder
rm -rf $HOME/AutomaticInstall

########################################################################################

#If zsh doesn't work, the problem is probably your termux
echo "Installing my zsh"
cd $HOME
wget -q  https://github.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/raw/main/AutomaticInstall/myzsh.tar.xz
tar -xvJf myzsh.tar.xz && mv ~/zsh/.* ~/
rm -rf ~/zsh
chsh -s zsh
rm -rf $HOME myzsh.tar.xz
sleep 4

echo "Installing..."

cd $PREFIX/etc/proot-distro/

sleep 2

wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/kali.sh

sleep 2

cd $PREFIX/bin/
wget -q https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/AutomaticInstall/kali

sleep 1
chmod +x $PREFIX/bin/kali

#Restore Kali distro

cd $HOME

proot-distro restore /sdcard/Download/kali.tar.xz > /dev/null 2>&1
sleep 1

echo "Done"
sleep 3

echo "You can now log in with kali"
sleep 3

echo "Use the command kali, and kali -r with root without password"
sleep 3
