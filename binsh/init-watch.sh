#!/usr/bin/env bash

echo "#!/bin/sh" >>watch.sh
echo "" >>watch.sh
echo "fswatch -or ./romannumerals.csx | xargs -n1 -I{} dotnet script romannumerals.csx" >>watch.sh
