; <COMPILER: v1.1.37.02>
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
global isRunning := false
global keybind := ""
global oldKeybind := ""
global delay := 10
global waitingForKeybind := false
Gui, Color, 131313
Gui, Font, s10, Consolas
Gui, Add, Text, cA276A2,
Gui, Font, s12, Consolas
Gui, Add, Text, cA276A2, Current Keybind:
Gui, Add, Text, vKeybindDisplay cA276A2 w200 h20, NONE
Gui, Add, Button, gSetKeybind, Set Keybind
Gui, Font, s12, Consolas
Gui, Add, Text, cA276A2, Macro Speed (ms):
Gui, Add, Edit, vDelayEdit w52, %delay%
Gui, Add, Button, gSaveSettings, Save
Gui, Font, s10, Consolas
Gui, Show,, Tweenty's Macro
return
SetKeybind:
if (oldKeybind != "")
{
Hotkey, %oldKeybind%, ToggleMacro, Off
}
GuiControl,, KeybindDisplay, Select a Keybind..
Input, keybind, L1 T1
if (ErrorLevel = "Timeout")
{
GuiControl,, KeybindDisplay, NONE
return
}
StringUpper, keybind, keybind
GuiControl,, KeybindDisplay, %keybind%
Hotkey, ~*%keybind%, ToggleMacro
oldKeybind := keybind
GuiControl,, KeybindDisplay, %keybind%
return
SaveSettings:
GuiControlGet, keybind, , KeybindDisplay
GuiControlGet, delay, , DelayEdit
delay := (delay < 1) ? 1 : delay
return
ToggleMacro:
isRunning := !isRunning
if isRunning {
SetTimer, RunMacro, % delay
} else {
SetTimer, RunMacro, Off
}
return
RunMacro:
Send, {Blind}{WheelUp}
Sleep, %delay%
Send, {Blind}{WheelDown}
Sleep, %delay%
return
GuiClose:
ExitApp