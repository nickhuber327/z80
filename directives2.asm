;Comment line 1 to change message
ThinkPositive equ 1
PrintChar equ &BB5A

org &8100
	ld hl, Introduction
	call PrintString
	call NewLine
	ld hl, Message
	call PrintString
ret

PrintString:
	ld a, (hl)
	cp 255
	ret z
	inc hl
	call PrintChar
jr PrintString

Introduction:
	db 'Thought fo the day...', 255

ifdef ThinkPositive
	Message: db 'Z80 is Awesome!', 255
else
	Message: db '6510 sucks!', 255
endif

NewLine:
	ld a,13
	call PrintChar
	ld a,10
	call PrintChar
ret