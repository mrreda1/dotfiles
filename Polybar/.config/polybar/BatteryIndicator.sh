#!/bin/bash

phone=$(upower -e | grep phone)

if [ "$phone" ]; then
    command=$(upower -i "$phone" | grep percentage | awk '{print $NF}')
    echo -n " $command"
fi

headphone=$(upower -e | grep headset)

if [ "$phone" ] && [ "$headphone" ]; then
    echo -n "   "
fi

if [ "$headphone" ]; then
    command=$(upower -i "$headphone" | grep percentage | awk '{print $NF}')
    echo -n " $command"
fi

if [ ! "$phone" ] && [ ! "$headphone" ]; then
    echo "";
fi
