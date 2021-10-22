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
; else run WindowsTerminal.exe
return