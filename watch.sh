#!/bin/sh
fswatch -or ./play.fsx | xargs -n1 -I{} bash runner.sh play.fsx
