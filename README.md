# KaliNethunter-Moderate-Proot-On-Termux
This is a Kali Nethunter Xfce moderated some things and environment to make it look prettier, you can also run some .exe stuff in this Kali Nethunter (Minimum to run games is 8GB or 12GB RAM). If you install this proot-distro on a version of Android 12 or later, you have to disable Phantom process killer.

[Disable Phantom Process](https://github.com/KitsunedFox/termux-monet?tab=readme-ov-file#Phantom-Process-Killer)

## Preview
### 🐉kali@localhost🐉
![](https://github.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/blob/main/KaliNethunter-Moderate-Proot-On-Termux-Kali.png)

### 🐉root@localhost🐉
![](https://github.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/blob/main/KaliNethunter-Moderate-Proot-On-Termux-Root.png)

# To Do

#### First, Download Kali-Linux Distro From Here. [6.5GB]
[Download](https://drive.google.com/file/d/10yWVSROO6lSX3U-AyvqPRKl50jOLnIwv/view?usp=sharing
)

## Installation

Download kali.tar.xz to Device's Download folder first. 

### Give Storage Permission

```
termux-setup-storage
```

### In your terminal, paste this. It will take in 30 minutes or 1 hour

```
wget https://raw.githubusercontent.com/Sota4Ever/KaliNethunter-Moderate-Proot-On-Termux/main/ProotKali.sh && bash ProotKali.sh
```

### Login again to termux

```
exit
```
Before login to proot,start termux-x11 first. 
``` 
termux-x11 :1 
```

## Put the command to start Kali distro

```
kali
```

### Put the command to start Kali distro with root

```
kali -r
```

### Start ProotKali Desktop

```
kalis
```
## Add your external SD card
In the proot-distro text, you can mount your external SD card (if you have), you can add in the next line: 

```
nano $PREFIX/bin/proot-distro
```

Go to line 1900 with Ctrl + / and add:

```
set -- "--bind=/storage/{you SD card}:/external_sd" "$@" 
```

It has to be in the same position as the other lines above

## Termux 
[Download](https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_universal.apk) 

## Termux-x11 
[Download](https://archive.org/download/termux-x11/app-universal-debug.apk) 

## Termux-x11 Custom Resolution
1920:1080
