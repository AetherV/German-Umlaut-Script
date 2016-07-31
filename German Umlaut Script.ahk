;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                   ;;
;; German Umlaute Convenience Script                 ;;
;; for Superior US English Keyboard Layouts          ;;
;;                                                   ;;
;; version 0.3 - 07/18/04                            ;;
;; ck <use www.autohotkey.com forum to contact me>   ;;
;;                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Usage Instructions:
;; -------------------
;; Load Script into AutoHotKey (only verified to work with 1.0.15 and Windows XP)
;; a) Press any of the TRIGGERKEYS [u,U,a,A,o,O,s] in any application of your choice
;; b) Within DELAY seconds, press the UMLAUTKEY to morph it into [�,�,�,�,�,�,�]

; after pressing a TRIGGERKEY, you have to wait DELAY seconds to press the UMLAUTKEY
; and make it appear normally (without triggering any Umlaut morphing)
DELAY = 1.0 ; default = 1
UMLAUTKEY = 1 ; default = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; You shouldn't have to edit below this line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#NoTrayIcon 

; remember the latest activated Umlaut
UMLAUT = x

$u::
; Above: Use the $ to force the hook to be used, which prevents an
; infinite loop since this subroutine itself sends Numpad0, which
; would otherwise result in a recursive call to itself.
; mirror self
Send, u
; initialize current Umlaut
UMLAUT = �
Goto, WaitForUK

$+u::
Send, U
UMLAUT = �
Goto, WaitForUK

$o::
Send, o
UMLAUT = �
Goto, WaitForUK

$+o::
Send, O
UMLAUT = �
Goto, WaitForUK

$a::
Send, a
UMLAUT = �
Goto, WaitForUK

$+a::
Send, A
UMLAUT = �
Goto, WaitForUK

$"::
Send, "
UMLAUT = �
Goto, WaitForUK

$s::
Send, s
UMLAUT = �



WaitForUK:
; disable this and every other TRIGGERKEY to speed things up
Hotkey, $u, Off
Hotkey, $+u, Off
Hotkey, $o, Off
Hotkey, $+o, Off
Hotkey, $a, Off
Hotkey, $+a, Off
Hotkey, $s, Off
Hotkey, $", Off

; Most editors can handle the fastest speed (-1)
SetKeyDelay, 0 ; 0 for reliability

; repeat until EITHER the UMLAUTKEY was hit or any other key breaking the sequence (non TRIGGERKEY)
Loop
{
	; watch next input string (only wait for exactly one char, mirror input, ignore backspace and wait DELAY seconds)
	Input, UserInput, V L1 B T%DELAY%
	if UserInput = %UMLAUTKEY% 
	{
	 	Send, {backspace 2}%UMLAUT%
	 	break
        } 
        else if UserInput = u
		UMLAUT = �
	else if UserInput = o
		UMLAUT = �
	else if UserInput = +o
		UMLAUT = �
	else if UserInput = a
		UMLAUT = �
	else if UserInput = A
		UMLAUT = �
	else if UserInput = s
		UMLAUT = �
	else if UserInput = "
		UMLAUT = �
	else 
		break
}

; re-enable all initial Umlaut TRIGGERKEYS
Hotkey, $u, On
Hotkey, $+u, On
Hotkey, $o, On
Hotkey, $+o, On
Hotkey, $a, On
Hotkey, $+a, On
Hotkey, $s, On
Hotkey, $", On

; finish this hotkey handling routine	
return