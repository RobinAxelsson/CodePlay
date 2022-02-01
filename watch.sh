#!/bin/sh
#fswatch -or . | xargs -n1 -I{} bash run-hello.sh
fswatch -or . | xargs -n1 -I{} bash compile.sh && bash run-hello.sh
