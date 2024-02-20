#!/bin/bash

TITLE="POMODORO TIMER"
MESSAGE="Time to take a break"

ICON="face-cool"
TIMER=$((25*60))

SOUND="/usr/share/gnome-nibbles/sounds/bonus.ogg"
SOUND="/usr/share/quadrapassel/sounds/quadrapassel.ogg"

sleep $TIMER && notify-send "$TITLE" "$MESSAGE" --icon=$ICON && paplay $SOUND 
