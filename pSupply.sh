#!/bin/bash
# pSupply.sh Created: 11/22/2024 Updated: 04/20/2025
# Robert W. Eckert - rweckert@gmail.com
#         _________                   .__         
# ______ /   _____/__ ________ ______ |  | ___.__.
# \____ \\_____  \|  |  \____ \\____ \|  |<   |  |
# |  |_) )        \  |  /  |_) )  |_) )  |_\___  |
# |   __/_______  /____/|   __/|   __/|____/ ____|
# |__|          \/      |__|   |__|        \/v:1.0
# A simple power supply monitoring tool.

hc=$'\u2010'
fcall="export -f"
bcall="bash -c"
afp=$(dirname "$(realpath "$0")")
export app="$afp/pSupply.sh"
export td="/tmp"
export tf="$td/pSupply.txt"
export ti="$td/pSupply.ini"
export tt="$td/pSupply.tmp"
export th="$td/pSupply.html"
export fs="$td/FileSave.tmp"
export ps="$td/pSupplyStats.tmp"

# Main Menu: ===========================
function mMenu {
upower -i /org/freedesktop/UPower/devices/battery_BAT0 > "$tf"
bp=$(grep "percentage:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bs=$(grep "state:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
if [[ "$bs" == "charging" ]]; then
bs="Charging"
else
bs="Discharging"
fi

yad --form --css="$tp" --posx=20 --posy=20 --fixed --title="pSupply-Menu" --name="mMenu" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=8 \
--field="$bs:" "$bp" \
--field="Refresh":fbtn "$app mRefresh" \
--field="Details":fbtn "$app vDetail" \
--field="Meter":fbtn "$app vCharge" \
--field="Tray":fbtn "$app mTray" \
--field="Theme":fbtn "$app mTheme" \
--field="Help":fbtn "$app mHelp" \
--field="Exit":fbtn "$app mExit" 2>/dev/null
}
$fcall mMenu

# Main Tray: ===========================
function mTray {
wmctrl -c 'pSupply-Menu'
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
upower -i /org/freedesktop/UPower/devices/battery_BAT0 > "$tf"
bp=$(grep "percentage:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bs=$(grep "state:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
if [[ "$bs" == "charging" ]]; then
bs="Charging"
else
bs="Discharging"
fi
yad --notification --css="$tp" \
--image="battery" \
--text="pSupply Tray" \
--menu="Status: $bs !!gtk-execute|Percentage: $bp !!gtk-apply|Supply Details !$app vDetail!gtk-dialog-info|Main Menu !$app mMenu!gtk-home|Refresh !$app tRefresh!gtk-refresh|Quit Menu!quit!gtk-quit" \
--command="menu" 2>/dev/null
}
$fcall mTray

# View Detial: =========================
function vDetail {
upower -i /org/freedesktop/UPower/devices/battery_BAT0 > "$tf"
np=$(grep "native-path:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
vn=$(grep "vendor:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
mn=$(grep "model:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
hp=$(grep "present:"  $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
br=$(grep "rechargeable:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bs=$(grep "state:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
wl=$(grep "warning-level:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
be=$(grep "energy:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
ee=$(grep "energy-empty:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
ef=$(grep "energy-full:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
ed=$(grep "energy-full-design:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
er=$(grep "energy-rate:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bv=$(grep "voltage:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
cc=$(grep "charge-cycles:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bp=$(grep "percentage:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bc=$(grep "capacity:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
up=$(grep "updated:" $tf | sed 's/  //g' | sed 's/updated://g' | awk 'BEGIN {FS="(" } { print $1 }')
# technology
pbt=$(grep "technology:"  $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
if [[ "$pbt" == *"-"* ]]; then
pbt=$(echo "$pbt" | sed 's/[-]/ /g')
bt=$hc$pbt
else bt=$(grep "technology:"  $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
fi
dt=$(date '+%m/%d/%Y %H:%M:%S');
echo "Powert Supply Stats Report: $dt" > "$ps"
echo "========================================" >> "$ps"
echo "Vendor: $vn" >> "$ps"
echo "Model: $mn" >> "$ps"
echo "Hardware: $np" >> "$ps"
echo "Status: $bs" >> "$ps"
echo "Charge: $bp" >> "$ps"
echo "Capacity: $bc" >> "$ps"
echo "Technology: $bt" >> "$ps"
echo "Present: $hp" >> "$ps"
echo "Rechargeable: $br" >> "$ps"
echo "Warning Level: $wl" >> "$ps"
echo "Energy: $be" >> "$ps"
echo "Energy Empty: $ee" >> "$ps"
echo "Energy Full: $ef" >> "$ps"
echo "Energy Full Design: $ed" >> "$ps"
echo "Energy Rate: $er" >> "$ps"
echo "Battery Voltage: $bv" >> "$ps"
echo "Charge Cycles: $cc" >> "$ps"
echo "Updated: $up" >> "$ps"
ydo=$(yad --form --css="$tp" --posx=20 --posy=115 --width=600 --height=500 --scroll --title="pSupply-Detail" --name="vDetail" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Print":5 --button="Refresh":4 --button="Edit Stats":3 --button="Save Stats":2 --button="Close":1 --columns=1 \
--field="Vendor" "$vn" \
--field="Model" "$mn" \
--field="Hardware" "$np" \
--field="Status" "$bs" \
--field="Charge" "$bp" \
--field="Capacity" "$bc" \
--field="Technology" "$bt" \
--field="Present" "$hp" \
--field="Rechargeable" "$br" \
--field="Warning Level" "$wl" \
--field="Energy" "$be" \
--field="Energy Empty" "$ee" \
--field="Energy Full" "$ef" \
--field="Energy Full Design" "$ed" \
--field="Energy Rate" "$er" \
--field="Battery Voltage" "$bv" \
--field="Charge Cycles" "$cc" \
--field="Updated" "$up" 2>/dev/null)
ydo=$?
if [[ $ydo -eq 5 ]]; then
yad --print --css="$tp" --filename="$ps" --center
vDetail
fi
if [[ $ydo -eq 4 ]]; then wmctrl -c 'pSupply-Detail' & vDetail; fi
if [[ $ydo -eq 3 ]]; then
xdg-open "$ps"
vDetail
fi
if [[ $ydo -eq 2 ]]; then fSave; fi
}
$fcall vDetail

# View Charge: =========================
function vCharge {
upower -i /org/freedesktop/UPower/devices/battery_BAT0 > "$tf"
bp=$(grep "percentage:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
bs=$(grep "state:" $tf | sed 's/ //g' | awk 'BEGIN {FS=":" } { print $2 }')
if [[ "$bs" == "charging" ]]; then
bs="Charging"
else
bs="Discharging"
fi
ydo=$(echo "$bp" | yad --progress --css="$tp" --posx=20 --posy=115 --width=350 --text="$bs: $bp" --title="pSupply-Charge" --name="vCharge" --window-icon="text-x-script" --button="Refresh":1 --button="Close":0)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'pSupply-Charge' & vCharge; fi
}
$fcall vCharge

function mRefresh {
wmctrl -c 'pSupply-Menu'
mMenu
}
$fcall mRefresh

function tRefresh {
ypi=`/bin/ps -fu $USER| grep "pSupply Tray" | grep -v "grep" | awk '{print $2}'`
kill -9 $ypi
mTray
}
$fcall tRefresh

function fSave {
ydo=$(yad --file --save --css="$tp" --width=400 --height=300 --center --title="pSupply-Save File:" --name="fSave" --window-icon="document-save" --on-top > $fs)
ydo=$?
if [[ $ydo -eq 252 ]]; then vDetail; fi
if [[ $ydo -eq 1 ]]; then vDetail; fi
if [[ $ydo -eq 0 ]]; then
read sf < "$fs"
cp "$tf" "$fs"
vStats
fi
}
$fcall fSave

# Menu Theme: ==========================
function mTheme {
gut='@sh -c "echo %2 > $tf & $app tUser"'
gst='@sh -c "echo %5 > $tf & $app tSystem"'
ydo=$(yad --form --css="$tp" --posx=20 --posy=115 --width=300 --fixed --title="pSupply-Theme" --name="mTheme" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Help":3 --button="About":2 --button="Close":1 \
--field="Custom Theme"::LBL "" \
--field="Load Theme:FL" "/usr/share/themes/" \
--field="Apply Custom Theme":fbtn "$gut" \
--field="System Default"::LBL "" \
--field="Mode:CB" "Light Theme\!Dark Theme" \
--field="Apply System Theme":fbtn "$gst" \
--field="Browse Themes Folder":fbtn "$app tBrowse" 2> /dev/null)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'pSupply-Theme'; fi
if [[ $ydo -eq 2 ]]; then mAbout; fi
if [[ $ydo -eq 3 ]]; then mHelp; fi
}
$fcall mTheme

# User Selected Theme: =================
function tUser {
read gut < "$tf"
sed -i '/stheme:/d' "$ti"
echo "stheme:$gut" >> "$ti"
tApply
}
$fcall tUser

# System Theme: ========================
function tSystem {
read gst < "$tf"
if [ "$gst" = "Dark Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze-Dark/gtk-4.0/gtk.css" >> "$ti"
fi
if [ "$gst" = "Light Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
fi
tApply
}
$fcall tSystem

# Apply Theme: =========================
function tApply {
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
wmctrl -c 'pSupply-Menu'
wmctrl -c 'pSupply-Theme'
mMenu
}
$fcall tApply

# Browse Theme: ========================
function tBrowse {
xdg-open "/usr/share/themes/"
}
$fcall tBrowse

# Main Help: ===========================
function mHelp {
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="pSupply-Documentation" --name="mHelp" --window-icon="text-html" --uri="https://github.com/rweckert/pSupply/blob/488025edf09b585d66a2838440ebecb2124e341b/README.md" --file-op
}
$fcall mHelp

# About ================================
function mAbout {
yad --about --css="$tp" \
--window-icon="text-x-script" \
--image="text-x-script" \
--authors="Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="A simple power supply monitoring tool." \
--copyright="Updated 04/20/2025 by Robert W Eckert" \
--pversion="Version: 1.0" \
--pname="pSupply" \
--button="Close!gtk-close":1
}
$fcall mAbout

# Load Menu: ===========================
function mLoad {
if test -f "$ti"; then
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
mMenu
else
export tp=""
mMenu
fi
}
$fcall mLoad

# Exit and Cleanup =====================
function mExit {
wmctrl -c 'pSupply-Menu'
wmctrl -c 'pSupply-Detail'
wmctrl -c 'pSupply-Charge'
wmctrl -c 'pSupply-Theme'
wmctrl -c 'pSupply-Documentation'
rm -f "$tf"
rm -f "$tt"
rm -f "$th"
rm -f "$fs"
exit
}
$fcall mExit

if [ -z "$1" ]; then mLoad; else $1; fi
