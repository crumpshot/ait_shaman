HotKeySet("{F8}", "__ExitBot")

msgbox(0,"BotRunning", "Bot is active")
WinActivate("EverQuest","")

while(1)
sleep(200)
__outofCombatSit()
__canni()
__checkGroupHealth()
;sleep(5000) ;iterative testing purposes
   WEnd

Func __healTarget()
   Send("3")
EndFunc

Func __ExitBot()
   msgbox(0,"BotDone", "Bot is stopped")
   Exit
EndFunc

Func __canni()
   $shmHP = __hpcheck80() ; returns 1 or 0 for shm HP over 80
   $shmMANA = __manaCheck80() ; returns 1 or 0 for shm mana over 80
   If $shmHP = 1 And $shmMANA = 0 Then ; if shm HP over 80 and mana under 80, then send Canni hotkey
	  $currentCombatPixel = pixelgetcolor(1236,867) ;checks for black incombat icon logo - hex value: 0x000000
	 Send("0")
	 sleep(1500)
	  Else
	  EndIf
EndFunc

Func __outofCombatSit()
   $currentCombatPixel = pixelgetcolor(1236,867) ;checks for black incombat icon logo - hex value: 0x000000
   $standingPixel = pixelgetcolor(1801,1005) ;checks sit/stand button for standing status - hex value:0xC6C6C9 or 0xCACACD
   $recentCombatPixel = pixelgetcolor(1139,947) ;checks combat timer bar exists - hex value:0x999699
   ;msgbox(0,"test", $standingPixel)
   If $currentCombatPixel <> 0 AND $standingPixel = 13290189 AND $recentCombatPixel = 10065561 Then ;if out of combat AND standing AND recently in combat/, then send SIT hotkey
	  sleep(2000)
	  Send("x")
	  sleep(1000)
   EndIf
EndFunc

Func __hpCheck80()
      $hpPixel = pixelgetcolor(1220,900) ;gets hp pixel at 80% mark. Set this coords value per character/screen
   ;msgbox(0,"hp", $hpPixel)
   If $hpPixel = 14221312 Then ;IFstatement returns VALUE 1 for mana bar color being BLUE (ie has >=80% mana) hex value:0xD90000
	  Return 1
   Else
	  Return 2
   EndIf
EndFunc


Func __manaCheck80()
      $manaPixel = pixelgetcolor(1220,910) ;gets mana pixel at 80% mark. Set this coords value per character/screen
   If $manaPixel = 29415 Then ;IFstatement returns VALUE 1 for mana bar color being BLUE (ie has >=80% mana) hex value:0x0072E7
	  Return 1
   Else
	  Return 0
   EndIf
EndFunc

Func __checkGroupHealth() ;logic to evaluate group member's HP for healing them
$selfHpPixel75 = pixelgetcolor(1290,900) ;low hp pixel for self:0x393C39
$party1HpPixel75 = pixelgetcolor(2004,609) ;low hp pixel for partymember1:0x393C39
$party2HpPixel75 = pixelgetcolor(2004,649) ;low hp pixel for partymember2:0x393C39
   If $selfHpPixel75 = 3750969 Then
	  Send("{F1}")  ;target self hotkey
	  sleep(200)
	  Send("5")  ;heal target hotkey
   Elseif $party1HpPixel75 = 3750969 Then
	  Send("{F2}")  ;target party1 hotkey
	  sleep(200)
	  Send("5")
   Elseif $party2HpPixel75 = 3750969 Then
	  Send("{F3}")  ;target party2 hotkey
	  sleep(200)
	  Send("5")
   EndIf
;$party3HpPixel75 = pixelgetcolor(1220,900)
;$party4HpPixel75 = pixelgetcolor(1220,900)
;$party5HpPixel75 = pixelgetcolor(1220,900)
EndFunc

;--------Future Functions To Write
Func __mezAdds()
EndFunc

Func __conCheck() ;logic to determine if spells should be cast on mob based on CON
EndFunc

Func __slowTarget()
EndFunc
