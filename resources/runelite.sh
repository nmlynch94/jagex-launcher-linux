#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "$SCRIPT_DIR" >> tst.txt
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>"$SCRIPT_DIR/runelite_launch_debug.txt" 2>&1

"$SCRIPT_DIR/RuneLite.AppImage" --appimage-extract-and-run
