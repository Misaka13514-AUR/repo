#!/bin/bash
export WINEPREFIX="$HOME"/.hp-prime-virtual-calculator/wine
if [ ! -d "$HOME"/.hp-prime-virtual-calculator ] ; then
   mkdir -p "$HOME"/.hp-prime-virtual-calculator/wine
fi
WINEDEBUG=-all wine /opt/hp-prime-virtual-calculator/HPPrime.exe "$@"
