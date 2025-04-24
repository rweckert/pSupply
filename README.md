# <img align="left" width="48" src="Icon-pSupply.png" /> pSupply
A simple power supply monitoring tool for Linux.

### Script Purpose as a Tool:
View all details of battery supply accessable from a menu or via tray menu. Easily view, monitor, export all details of the primary power supply of your system.

![pSupply Screenshot](https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/screenshot-pSupply.jpg)

### Setup:
1. Please review "[Common System Requirements](https://github.com/rweckert/pSupply/blob/main/README.md#common-system-requirements)" and "[Critical System Requirements](https://github.com/rweckert/pSupply/blob/main/README.md#critical-system-requirements)" sections below for basic and critical requirements to run this script successfully. <br/>
2. Save the pSupply.sh file to a directory. <br/>
3. Make the pSupply.sh script executable by running the following command in the same directory as the pSupply.sh file: <br/>
_chmod +x pSupply.sh_

### Features:
- Access all battery specifications. <br/>
- Print, Export or Save all battery specifications. <br/>
- Power meter showing battery status and current charge. <br/>
- Convenient tray menu to battery charge status and details. <br/>
- Use the 'F1' key for documentation from any main window. <br/>

### Typical Usage:
When opening the pSupply script the main menu will appear. This shows you the current status of the battery either in "Charging" or "Discharging" status. This is followed by the current percentage that the battery is holding in charge. The "Details" option will open a detailed view of battery specifications and status. The option for "Tray" allows you to use pSupply from the system tray showing current current charge capacity and acces to all options of the pSupply script.

### Detailed Options and Usage:
When opening pSupply, you will have the following options from the main menu: <br/>
**- Status:** Displays battery status and will show either "Discharging" or "Charging". <br/>
**- Percentage:** Shows the current percentage of battery charge. <br/>
**- Refresh:** Updates the status and the percentage of battery charge. <br/>
**- Details:** Opens the "pSuppy Details" window showing all specifics of the primary battery source. <br/>
**- Meter:** Displays a meter showing status and battery usage percentage. <br/>
**- Tray:** Opens the pSupply Tray menu shown by a battery tray icon. <br/>
**- Theme:** Options will allow you to select a theme for pSupply. <br/>
**- Help:** Opens pSupply documentation. <br/>
**- Exit:** Closes all vAlias windows and menus.

### Details View:
The "pSupply-Details" window will display several details about your primary battery source. Options include the following: <br/>
**- Print:** Prints a list of all battery details as seen from the "Details View" window. <br/>
**- Refresh:** Updates battery specifications and displays any changes. <br/>
**- Edit Stats:** Opens a text file showing all battery specifics using the default text editor. <br/>
**- Save Stats:** Save a text file displaying all battery specifics into a directory specified. <br/>
**- Close:** Closes the "pSupply-Detail" window. <br/>

### Meter View:
The meter view displays a meter showing you the current status of the battery either in "Charging" or "Discharging" mode and percentage of the battery. Options include the following: <br/>
**- Refresh:** Updates the meter status window. <br/>
**- Close:** Closes the meter status window. <br/>

### Tray Menu:
Selecting the "Tray" option from the main menu will close open the system tray mode of pSupply represented by a battery icon. The main menu will close when the Tray option has been selected. Options include the following:
**- Status:** Displays battery status either in "Charging" or "Discharging" modes. <br/>
**- Percentage:** Shows battery charge percentage. <br/>
**- Supply Details:** Opens the battery details view. <br/>
**- Main Menu:** Opens the main menu. <br/>
**- Refresh:** Updates the battery percentage and details. <br/>
**- Quit Menu:** Closes the pSupply tray menu. <br/>

### Theme Options:
The "Theme" main menu option allows the user to change settings for the theme being used, as well as access to "Help" and "About" options:<br/>
**- Load Theme:** Allows the user to browse their system for a theme to use.<br/>
**- Apply Loaded Theme:** Applies the loaded theme. Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Mode:** Select basic system theme available in the system for "Light Theme" or "Dark Theme". This default uses the "Breeze" theme package located in the "/usr/share/themes/" folder.<br/>
**- Apply System Theme:** Applies the Mode selected for either "Light Theme" or "Dark Theme". Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Browse Themes Folder:** Browse the default themes folder "/usr/share/themes/".<br/>
**- Help:** Opens mRunner help documentation.<br/>
**- About:** Opens the about window showing script credits.<br/>
**- Close:** Closes the "Options" window.

### Notes:
- pSupply can be ran from any directory. <br/>
- pSupply uses the /tmp/ folder for temporary and .ini files. <br/>
- Use the 'F1' key for documentation from any main window. <br/>

### pSupply Shortcut File:
Save the following as a file named "pSupply.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored: <br/>
[Desktop Entry] <br/>
Name=pSupply <br/>
GenericName=pSupply <br/>
Comment=A simple power supply monitoring tool. <br/>
Exec=/PathToScript/pSupply.sh <br/>
Type=Application <br/>
Icon=battery <br/>
Terminal=false <br/>

### Common System Requirements:
Common shell commands found in most Linux installations are used to provide system functionalilty for this and other scripts shared from this profile. For thoroughness, these common shell commands are listed in alphabetical order with version and man page link for review: [https://github.com/rweckert/pSupply/blob/bb1772f8dce90ba74f3ba87defa1e3ec33ab59bf/README-Basic-Requirements.md](https://github.com/rweckert/pSupply/blob/bb1772f8dce90ba74f3ba87defa1e3ec33ab59bf/README-Basic-Requirements.md)

### Critical System Requirements:
Packages listed below provide the core ingredients for graphic display and desired output that enables SCRIPTNAME deliver output and are critical for successful execution of the the script:

| Package       | Version              | Notes         |
|     :---:     |         :---:        | :---          |
| yad | 14.0+ (GTK+ 3.24.41) | A tool for developing graphical user interfaces in Linux and is used by this script to generate menus and dialog windows, is written by Victor Ananjevsky. **Download:** [https://github.com/v1cont/yad](https://github.com/v1cont/yad) **Setup:** Step by step instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch) |
| upower | 1.90.3 | A simple command line client for the UPower daemon. Written by David Zeuthen davidz@redhat.com. More information regarding upower can be found at [https://manpages.ubuntu.com/manpages/jammy/man1/upower.1.html](https://manpages.ubuntu.com/manpages/jammy/man1/upower.1.html) and [https://www.cyberciti.biz/faq/linux-upower-command-examples-and-syntax/](https://www.cyberciti.biz/faq/linux-upower-command-examples-and-syntax/) |

### Closing:
Script interface written by: Robert W. Eckert - rweckert@gmail.com Please feel free to email to submit bugs, changes or requests. This script comes with absolutely no warranty. See the link for the GNU General Public License, version 3 or later listed below for further details.

---

### Project Contents:
**Project Page:** <br/>
[https://github.com/rweckert/pSupply](https://github.com/rweckert/pSupply) <br/>
**Source File:** <br/>
[https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/pSupply.sh](https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/pSupply.sh) <br/>
**Documentation File:** <br/>
[https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/README.md](https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/README.md) <br/>
**Project Screenshot:** <br/>
[https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/screenshot-pSupply.jpg](https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/screenshot-pSupply.jpg) <br/>
**Project Licensing:** <br/>
[https://github.com/rweckert/pSupply/blob/36a0ec6f0e3e80f6ec3cd93ec809427dff97fff0/LICENSE](https://github.com/rweckert/pSupply/blob/36a0ec6f0e3e80f6ec3cd93ec809427dff97fff0/LICENSE) <br/>
**GitHub Profile Page:** <br/>
[https://github.com/rweckert](https://github.com/rweckert)
