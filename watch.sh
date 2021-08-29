#!/bin/sh
fswatch -or . | xargs -n1 -I{} bash run-hello.sh
