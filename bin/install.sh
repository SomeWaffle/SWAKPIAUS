#!/bin/bash
#First of all, clean all the gunk out
clear

#All the variables for this script (DO NOT TOUCH)
ERROR='\033[31;1m'
INFO='\033[1;33m'
SUCCESS='\033[1;32m'
DATE_WITH_TIME=`date "+%Y-%m-%d %H:%M:%S"`

# Get the arguments passed from the Python app
distro=$1
package=$2

# Check if the distro and package are provided
if [[ -z "$distro" || -z "$package" ]]; then
    echo -e "Loading install.sh and settings things up..."
    sleep 2
    notify-send "Oops... This is very embarrasing... Uhh...   '/ᐠ｡ꞈ｡ᐟ\'  (TypeError: ArgumentNullException)" --app-name=SWAKPIAUS --icon=error --category=error --urgency=critical   
    echo -e "${ERROR}This is very   embarrasing... Uhh..." '/ᐠ｡ꞈ｡ᐟ\'
    echo -e "${ERROR}($DATE_WITH_TIME)[ERROR]: TypeError: ArgumentNullException. The 'distro' argument must be a string, not Null."
    echo -e "${ERROR}($DATE_WITH_TIME)[ERROR]: TypeError: ArgumentNullException. The 'package' argument must be a string, not Null."
    echo -e "${ERROR}($DATE_WITH_TIME)[ERROR]: Did you try to run this shell script as a user? In that case, please use the swakpiaus.py app"
    echo ""
    echo -e "${INFO}However, if you wanna do it the other way, you can. But before you do, please note that${ERROR} the app is way more user friendly."
    echo -e "${INFO}To use the Terminal${ERROR}(Not Recommended) ${INFO}use the following command: ./install.sh DistroName PackageType"
    exit 0
fi  

# Example output for testing
echo "Installing for distribution: $distro"
echo "Package selected: $package"

# Simulate installation logic
# (You can add actual package installation commands here)
echo "Starting installation for $distro with $package..."
sleep 4
echo -e "${INFO}Installation is starting now!"
sleep 1
echo "..."
clear
sleep 2
bash cd "/bin/installation/$distro/$package.sh"