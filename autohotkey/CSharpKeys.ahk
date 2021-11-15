
/*―――――――――――――――――――――/*―――――――――――――――――――――
/*
/*		Coding Keyboard by RAX
/*
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/

SoundBeep, m2 b zh0 ;activtion signal

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*      ← ↑ → ↓
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/
ä::Down
return 
ö::left
return
'::Right
return
å::Up
return

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*      ;{}[]()*'=>
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/
§::SendRaw,;
return
*¨::SendRaw *
return
*´::Send '
return
*+`::Send {``}{Space}
return
*F1::
SendRaw,{
return
*F2::
SendRaw,}
return
*F3::
Send {=}{>}
return
§ & 1::Send {[}
return
§ & 2::Send {]}
return
§ & 3::Send {(}
return
§ & 4::Send {)}
return
§ & p::Send public{Space}
return
§ & c::Send class{Space}
return
§ & t::Send string{Space}
return
§ & s::Send static{Space}
return
§ & i::Send interface{Space}
return
§ & v::Send void{Space}
return
§ & r::Send virtual{Space}
return
§ & o::Send override{Space}
return
§ & a::Send abstract{Space}
return


/*―――――――――――――――――――――/*―――――――――――――――――――――
/*    Home, end, selection
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/

CapsLock & ö:: ;Home
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{home}
else
	Send {Home}
return

CapsLock & ':: ;End
GetKeyState, state, Shift
if (state = "D")
	Send, {Shift Down}{end}
else
	Send {End}
return

*^!ä::*^+down
return
*^!p::*^+up
return
*^!'::*^+right
return
*^!ö::*^+left
return

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*    Block fold/unfold - editor specific
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/
Down::
IfWinActive, ahk_exe Code.exe ;Unfolds all layers beneath
Send ^k
Send ^å
return

Up::
IfWinActive, ahk_exe Code.exe ;Folds all layers beneath recursevly
Send ^k
Send ^´
return

Left::
IfWinActive, ahk_exe Code.exe ;Folds block in VS-Code
Send ^+´
IfWinActive, ahk_exe devenv.exe ;Folds block in Visual studio
{
	Send ^m
	Send ^s
}
return

right::
IfWinActive, ahk_exe Code.exe ;Unfolds a block in VS-Code
Send ^+å
IfWinActive, ahk_exe devenv.exe ;Unfolds a block in Visual studio
{
	Send ^m
	Send ^e
}
return

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*    Toggle, Focus to Chrome
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/

§ & q::
IfWinNotActive, ahk_exe chrome.exe
{
WinActivate, ahk_exe chrome.exe
WinWaitActive, ahk_exe chrome.exe
}
else
	Click
return

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*    Replacements
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/

§ & F1::Send {F1}
return
§ & F2::Send {F2}
return
§ & F3::Send {F3}
return
§ & F4::Send {F4}
return

*+¨::Send {^}{Space}
return
*^´::Send {´}{Space}
return
*<^>!¨::Send {~}{Space}
return
*^¨::Send {¨}{Space}
return

/*―――――――――――――――――――――/*―――――――――――――――――――――
/*    Exit Script
/*―――――――――――――――――――――/*―――――――――――――――――――――
*/

<^>!ä::
IfWinNotActive, ahk_exe code.exe
SendRaw ä
SoundBeep, m2 b zh0
ExitApp

<^>!å::
IfWinNotActive, ahk_exe code.exe
SendRaw å
SoundBeep, m2 b zh0
ExitApp

<^>!ö::
IfWinNotActive, ahk_exe code.exe
SendRaw ö
SoundBeep, m2 b zh0
ExitApp
