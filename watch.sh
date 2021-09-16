#!/bin/sh
fswatch -or ./play.fsx | xargs -n1 -I{} bash runner.sh play.fsx
# fswatch -or ./Program.fs | xargs -n1 -I{} bash runner-dotnet.sh
