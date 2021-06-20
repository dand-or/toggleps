#!/bin/zsh

set -eu

if [ ${EUID:-${UID}} = 0 ]; then
    echo 'start'
else 
    echo 'please sudo'
    exit 1
fi

# quit photoshop
osascript -e 'quit app "/Applications/Adobe Photoshop 2021/Adobe Photoshop 2021.app"'

# toggle language
DAT_ORIGINAL="/Applications/Adobe Photoshop 2021/Locales/ja_JP/Support Files/tw10428_Photoshop_ja_JP.dat"
DAT_BACKUP="/Applications/Adobe Photoshop 2021/Locales/ja_JP/Support Files/tw10428_Photoshop_ja_JP.dat.bk"
if [ -e $DAT_ORIGINAL ]; then
    mv $DAT_ORIGINAL $DAT_BACKUP
    echo "photoshop switched to english"
else
    mv $DAT_BACKUP $DAT_ORIGINAL
    echo "photoshop switched to japanese"
fi

# open photoshop
sleep 2s
open "/Applications/Adobe Photoshop 2021/Adobe Photoshop 2021.app"