#!/bin/sh
DIR=$(pwd)
for dir in $(ls $DIR); do
    echo $dir
    for subdir in $(ls $DIR/$dir); do
        echo ---$subdir
    done
done
