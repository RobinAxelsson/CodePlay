@echo off
@REM https://docs.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=windows

@rem wt -d c:\Users\axels\MS-Code ; split-pane -p "Command Prompt" ; split-pane -p "Ubuntu"
wt ; split-pane -p "Ubuntu" ; split-pane -p "Command Prompt" -d c:\Users\axels ; split-pane -p "Git Bash"