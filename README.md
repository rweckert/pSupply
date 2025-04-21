# pSupply
A simple power supply monitoring tool.

### Script Purpose as a Tool:
View all details of battery supply accessable from a menu or via tray menu. Easily view, monitor, export all details of the primary power supply of your system.



### Setup:
1) Save the pSupply.sh file to a directory. <br/>
2) Make the pSupply.sh script executable by running the following command in the same directory as the pSupply.sh file:<br/>
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
Save the following as a file named "pSupply.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored:
[Desktop Entry]
Name=pSupply
GenericName=pSupply
Comment=A simple power supply monitoring tool.
Exec=/PathToScript/pSupply.sh
Type=Application
Icon=battery
Terminal=false

### Common System Requirements:
The following applications are in general use of most Linux systems and are used in having vAlias deliver output:
- awk
- kill
- print
- read
- rm
- sed
- upower
- wmctrl
- xdg-open

### Critical System Requirements:
The most important requirement is the yad (yet another dialog) application which allows for the use of custom dialog, menu, and window options.

- yad 14.0+ (GTK+ 3.24.41) [https://github.com/v1cont/yad](https://github.com/v1cont/yad)

The mRunner script uses features of yad that do require version 14.0+ and built with GTK+ 3.24.41 or higher. Full setup instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch)

YAD (Yet Another Dialog), a tool for developing graphical user interfaces in Linux, is written by Victor Ananjevsky.

Script interface written by: Robert W. Eckert - rweckert@gmail.com
Please feel free to email to submit bugs, changes or requests.

### Project Contents:
**Project Page:** <br/>

**Source File:** <br/>

**Documentation File:** <br/>

**Project Screenshot:** <br/>

