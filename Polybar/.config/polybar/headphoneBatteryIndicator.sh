#!/bin/bash
# gobbl package needed

headphone='soundcore'
command=$(gobbl | grep -m 1 $headphone | awk '{print $NF}')

if [ $command ]; then
    echo $command;
else
    echo "x";
fi
