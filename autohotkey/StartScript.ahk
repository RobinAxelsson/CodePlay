; C:\Users\axels\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

/*
# - Win
! - Alt
^ - Ctrl
+ - Shift
& - Combine two hotkeys
< - Left of the two (eg left Alt)
> - Right of the two
<^>! - Alt Gr
* - Wildcard: fire hotkey even if extra modifiers are being held down

/*
-----------------------------------------------
2021 Keys
-----------------------------------------------
*/

MsgBox Starting Startscript.ahk

::@reload::
    Run, "C:\users\axels\MS-Code\Bash-Tasks\autohotkey\reload.ahk"
return

^!Space::
if WinExist("ahk_exe WindowsTerminal.exe")
    WinActivate
else
    run wt
return

^!r::
if WinExist("ahk_exe rider64.exe")
    WinActivate
return

^!b::
if WinExist("ahk_exe chrome.exe")
    WinActivate
else
    run chrome
return

^!c::
if WinExist("ahk_exe Code.exe")
    WinActivate
else
    run code
return

^!t::
if WinExist("ahk_exe Teams.exe")
    WinActivate
else
    run C:\Users\axels\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
return

