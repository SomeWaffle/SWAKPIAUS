#!/bin/bash

#First we will make a welcome message

#/bin/sh
clear
printf "Welcome to the SomeWaffle AKPI & AUS! \n"
printf "\n"
sleep 4
printf "This is a setup utility made by no other than SomeWaffle and runs fast to make sure to install all the packages you need!"
sleep 4
printf "\n"
printf "\n"
printf "😸 Script made by SomeWaffle & Helped by JackIV with love ❤️"
sleep 3
clear 
echo "~ SWAKPIAUS Medium Installation ~"
echo " "
echo "Packages that will be installed on your device:"
echo "obs-studio, vesktop, ulauncher, alvr_application"
echo "neofetch, heroic-launcher, unity, qbittorent, prism-launcher"
sleep 5
clear

#Requesting Root
echo "Requesting Root Access so you won't have to write it a few times"
sleep 3
echo "SWAKPIAUS is working... Please Wait..."
sleep 0.5
sudo echo "Root Access Accepted!"
sleep 2
echo "Loading.."
sleep 0.2

#Setting the environment up...
clear
echo "Now Cleaning..."
sleep 2
echo " "
echo "Please wait..."
sleep 2
echo " "
echo "Setting up Environment..."
sleep 3
echo " "
echo "Getting ready."
sleep 1
echo " "
echo "Getting ready.."
sleep 0.5
echo " "
echo "Getting ready........"
sleep 2
clear
echo "Installing Packages... Click CTRL + C to stop now!"
sleep 3

# Package Installing + Repository stuff
sudo ubuntu-drivers install nvidia:550
echo " "
echo "Installed Nvidia GeForce Driver(Version 550) Successfully! (1/10)"
sleep 2
clear
sudo apt-get install neofetch -y
echo " "
echo "Installed Neofetch! (2/10)"
sleep 2
clear
sudo apt install obs-studio -y
echo " "
echo "Installed OBS STUDIO! (3/10)"
sleep 2
clear
echo "Adding Repository, this will be quick..."
echo "Adding ULauncher Repository & Installing ULauncher... Sit Tight!"
sleep 1
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update
sudo apt install ulauncher -y
sleep 1
echo "Installed ULAUNCHER! (4/10)"
clear

#ALVR Installation Process
echo "tar.gz -> folder mode, portable_x86_64"
sleep 1
echo "Downloading & Installing ALVR to your Device... Please Wait..."
sleep 2
cd ~/Downloads
wget -O alvr_launcher.tar.gz https://github.com/alvr-org/ALVR/releases/download/v20.11.1/alvr_launcher_linux.tar.gz
sleep 2
sudo mkdir ~/Downloads/ALVR_Application
sleep 1
sudo tar -xvzf alvr_launcher.tar.gz -C ~/Downloads/ALVR_Application
sleep 2
sudo rm alvr_launcher.tar.gz
sleep 3
echo "ALVR Has been put in your /Downloads/ALVR_Application Folder! (5/10)"
echo "right here:"
sleep 2
clear
echo "CLOSE DOLPHIN"
echo "WHEN YOU ARE"
echo "READY TO"
echo "CONTINUE THE"
echo "SETUP! MEOW!"
dolphin ~/Downloads/ALVR_Application
sleep 2
clear

#Installing Vesktop
echo ".deb file -> installed app, portable_x86_64"
cd ~/Downloads
sleep 1
echo "Installing Vesktop! Please Wait..."
echo "Getting Deb File from GitHub..."
wget vesktop.deb https://github.com/Vencord/Vesktop/releases/download/v1.5.3/vesktop_1.5.3_amd64.deb
echo ""
echo "Installing Vesktop! Installing .deb file automatically!"
sudo dpkg -i vesktop_*_amd64.deb
echo ""
sudo "Making sure dependencies are not having issues..."
sudo apt-get install -f
sudo apt update
sleep 2
echo "Installed VESKTOP(VENCORD) (6/10)"
rm ~/Downloads/vesktop.deb
clear 
sleep 2

#Installing qbittorrent
echo "apt to application, portable_x86_64"
echo "Time to install qbittorrent!"
echo "Adding Repository to PPA"
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
echo "Updating Apt List & Installing qbittorrent!"
sudo apt-get update
sudo apt-get install qbittorrent -y
echo "Installed QBITTORRENT! (7/10)"

#Installing heroic-launcher
echo ".deb file -> installed app, portable_x86_64"
echo "Installing Heroic Launcher! Please Wait..."
echo "Getting Deb File from GitHub..."
wget heroic-launcher.deb https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.15.2/heroic_2.15.2_amd64.deb
sudo dpkg -i heroic_*_amd64.deb
echo ""
sudo "Making sure dependencies are not having issues..."
sudo apt-get install -f
sudo apt update
sleep 2
echo "Installed HEROIC LAUNCHER! (8/10)"
rm ~/Downloads/heroic_*_amd64.deb
clear 
sleep 2

#Installing prism-launcher
echo "flatpak(flathub) -> installed app, portable_x86_64"
sleep 1
echo "Installing Prism Launcher! Please Wait..."
sleep 1
echo "This will take longer... please be paitient. Thank you, meow!"
sleep 2
echo "Getting Flathub Ready..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sleep 1
sudo flatpak install flathub org.prismlauncher.PrismLauncher -y
sleep 1
echo "Installed PRISM LAUNCHER! (9/10)"
clear 
sleep 2

#Installing Unity Hub
echo "Installing Unity! Please Wait..."
sleep 1
echo "Installing Unity looks weird... are you sure you want to?"
sleep 1
echo "Installing Unity in 5 seconds, do CTRL + C to abort the installer!"
sleep 5
echo "Installing Unity now...."
clear
sleep 2
echo "Getting Environment Ready..."
sleep 1
echo "Installing..."
clear
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sleep 1
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
sleep 2
echo "Updating APT List"
sudo apt update
sleep 1 
echo "Installing Unity..."
sudo apt-get install unityhub -y
sleep 5
echo "Installed UNITY! (10/10)"
sleep 2
echo "Ending Installer... Do not close the Terminal..."
sleep 0.5
echo "$:Saving download info and removing files..."
echo "[Loading SomeWaffle CleanUp System]"
sleep 5
sudo apt autoclean
echo "Finished! 10/10"

echo "Checking if the packages were successfully installed"
sleep 2
sudo apt list --installed
sleep 2
echo "Checking..."
sleep 1
echo "Please Wait..."
sleep 5 
echo "Testing Neofetch..."
sleep 2
clear
sleep 0.5
neofetch
sleep 5
echo "Neofetch Started Successfully! ^^"
sleep 2
echo "Finished! Enjoy! Meow!"
sleep 5
clear
neofetch







# PS1='😸 \[\e[38;5;93;1m\]SomeWaffle-Kubuntu-\[\e[38;5;93m\]Terminal\[\e[0m\] \[\e[38;5;93;1m\]~\[\e[38;5;93m\]>\[\e[0m\] '
