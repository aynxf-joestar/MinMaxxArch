#!/usr/bin/env bash

## Author : Aynxf	 
## Github : @aynxf-joestar
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
dir="$HOME/.config/rofi/launchers/cool"
theme='ayy'
## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
