#!/bin/bash
# Script to switch headset profile with mic or without

var="$(pactl list cards | awk -v RS='' '/bluez/' | awk -F': ' '/Active Profile/ { print $2 }')"

if [[ $var =~ "a2dp-sink-aac" ]]; then
  pactl set-card-profile  bluez_card.90_9C_4A_D9_9F_0D headset-head-unit-msbc
else
  pactl set-card-profile  bluez_card.90_9C_4A_D9_9F_0D a2dp-sink-aac
fi
