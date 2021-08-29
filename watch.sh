#!/bin/sh
fswatch -or . | xargs -n1 -I{} gcc hello.c -o helloc
