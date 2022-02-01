#!/bin/sh
fswatch -or ./helloworld.csx | xargs -n1 -I{} dotnet script helloworld.csx
