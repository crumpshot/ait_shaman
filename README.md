HotKeySet("{F8}", "__ExitBot")

msgbox(0,"BotRunning", "Bot is active")
WinActivate("EverQuest","")

while(1)
sleep(200)
__canni()
   WEnd

Func __healTarget()
   Send("3")
EndFunc

Func __ExitBot()
   msgbox(0,"BotDone", "Bot is stopped")
   Exit
EndFunc

Func __canni()
   shmHP = __hpcheck80()
   shmMANA = __manaCheck80()
   If shmHP = 1 And shmMANA = 0 Then
	 Send("0")
	  EndIf
EndFunc

Func __outofCombatMed()
EndFunc

Func __hpCheck80()
      $hpPixel = pixelgetcolor(1220,900) ;gets hp pixel at 80% mark. Set this coords value per character/screen
   If $hpPixel = 0xD90000 Then ;IFstatement returns VALUE 1 for mana bar color being BLUE (ie has >=80% mana)
	  1
   Else
	  0
   EndIf
EndFunc


Func __manaCheck80()
      $manaPixel = pixelgetcolor(1220,910) ;gets mana pixel at 80% mark. Set this coords value per character/screen
   If $manaPixel = 0x0072E7 Then ;IFstatement returns VALUE 1 for mana bar color being BLUE (ie has >=80% mana)
	  1
   Else
	  0
   EndIf
EndFunc

;--------Future Functions To Write
Func __mezAdds()
EndFunc

Func __conCheck() ;logic to determine if spells should be cast on mob based on CON
EndFunc

Func __slowTarget()
EndFunc

Func __checkGroupHealth() ;logic to evaluate group member's HP for healing them
Send("{F1}")
EndFunc
