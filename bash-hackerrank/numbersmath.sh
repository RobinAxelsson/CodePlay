#!/bin/bash
read -r ansX
read -r ansY
echo $((ansX + ansY))
echo $((ansX - ansY))
echo $((ansX * ansY))
echo $((ansX / ansY))

#echo $(($ansX + $ansY)) dollar is unnecessary with aretmic operators
#could lead to bugs
