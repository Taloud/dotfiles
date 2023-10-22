#!/bin/bash
# Script to switch headset profile with mic or without

var="$(pactl list cards | awk -v RS='' '/bluez/' | awk -F': ' '/Active Profile/ { print $2 }')"

if [[ $var =~ "a2dp-sink-aac" ]]; then
  pactl set-card-profile bluez_card.2C_41_A1_07_65_4A headset-head-unit-msbc
else
  pactl set-card-profile bluez_card.2C_41_A1_07_65_4A a2dp-sink-aac
fi
