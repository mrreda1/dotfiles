#!/bin/bash

phone=$(upower -e | grep phone)
command=$(upower -i "$phone" | grep percentage | awk '{print $NF}')

if [ "$phone" ]; then
    echo "$command"
else
    echo "x"
fi
