#!/bin/bash
read -r EQ
VAR=$(bc -l <<<"$EQ")
printf "%3.3f\n" "$VAR"
