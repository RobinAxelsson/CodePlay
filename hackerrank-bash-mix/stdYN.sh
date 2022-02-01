#!/bin/bash
read -r YN
if [[ $YN =~ [Y|y] ]]; then
    echo YES
fi
if [[ $YN =~ [N|n] ]]; then
    echo NO
fi
