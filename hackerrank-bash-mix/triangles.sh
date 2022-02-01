#!/bin/bash
read -r A
read -r B
read -r C

if [[ $A == "$B" && $A == "$C" ]]; then
    echo EQUILATERAL
elif [[ $B == "$C" || $A == "$B" || $C == "$A" ]]; then
    echo ISOSCELES
else
    echo SCALENE
fi

# If all three sides are equal, output EQUILATERAL.
# Otherwise, if any two sides are equal, output ISOSCELES.
# Otherwise, output SCALENE.
