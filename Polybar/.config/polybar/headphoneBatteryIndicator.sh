#!/bin/bash

headphone=$(upower -e | grep headset)
command=$(upower -i "$headphone" | grep percentage | awk '{print $NF}')

if [ "$headphone" ]; then
    echo "$command"
else
    echo "x"
fi
