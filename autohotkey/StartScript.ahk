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

^!Left:: ;Home
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{home}
else
	Send {Home}
return

^!Right:: ;End
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{end}
else
	Send {End}
return

^!Up:: ;End
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{Ctrl Down}{home}
else
	Send {Ctrl Down}{home}
return

^!Down:: ;End
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{Ctrl Down}{end}
else
	Send {Ctrl Down}{End}
return

; Contour Roller Mouse
; ------------------------

; CapsLock & RButton::PrintScreen
; return

CapsLock & MButton::PrintScreen
return

CapsLock & Browser_Back::Browser_Forward
return

CapsLock & RButton::
    WinSet, AlwaysOnTop, Toggle, A
    SoundBeep, m2 b zh0, Text here
return

; Window Dragging

CapsLock & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, Off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, Off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return

; Chrome Ctrl+L focus on address bar

;-------------------------

::@ras::
    Send, robin.axelsson@sigma.se
return
; MsgBox Starting Startscript.ahk
::@nexer::
    Run, "C:\Program Files\Mozilla Firefox\firefox.exe" -p default-release
return

::@workspace1::
    Run, "C:\Program Files\Mozilla Firefox\firefox.exe" -p workspace1
return

::@home::
    Run, "C:\Program Files\Mozilla Firefox\firefox.exe" -p home
return

::@th2103::
    Run, "C:\Program Files\Mozilla Firefox\firefox.exe" -p TH2103
return

::@reload::
    Run, "C:\users\axels\MS-Code\Bash-Tasks\autohotkey\reload.ahk"
return

^!+Space::
if WinExist("ahk_exe WindowsTerminal.exe")
    WinActivate
else
    run wt
return

^!+r::
if WinExist("ahk_exe rider64.exe")
    WinActivate
return

^!+b::
if WinExist("ahk_exe chrome.exe")
    WinActivate
else
    run chrome
return

^!+c::
if WinExist("ahk_exe Code.exe")
    WinActivate
else
    run code
return

^!+d::
if WinExist("ahk_exe Discord.exe")
    WinActivate
else
    run code
return

^!+t::
if WinExist("ahk_exe Teams.exe")
    WinActivate
else
    run C:\Users\axels\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
return

^!+n::
if WinExist("ahk_exe firefox.exe")
    WinActivate
else
    run firefox.exe
return

