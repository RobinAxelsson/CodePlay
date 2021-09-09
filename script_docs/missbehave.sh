#!/bin/sh
# brew install htop
# brew install cpulimit
# brew install pidof

### Check system status
# htop
# F7, F8 change Nice-val
# F9 kill - pick 15 sigterm

### Search process
# ps | grep <name>

### get PID
#pidof <name>

### restrict process with renice from -20 to 19
### (the higher the nicer/less prioritized)
# sudo renice <nice-val-integer> -p <PID>

### restrict process with cpulimit
### percent is between 0-400
# cpulimit -l <procent> -p <PID>

### Kill processes: -> Sequence start from top
# kill -15 <PID> # sends sigterm
# kill     <PID> # also sends sigterm
# kill -2 <PID> # sends sigint
# kill -1 <PID> # sends sighup
# kill -9 <PID> # sends sigkill
