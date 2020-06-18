PrintChar equ &BB5A
org &8200
	ld ix, SquareBrackets
	ld hl, Message
	ld de, PrintString
	call DoBrackets

	call NewLine

	ld ix, CurlyBrackets
	ld hl, Message
	ld de, PrintString
	call DoBrackets
ret

DoBrackets:
	ld a, (ix+0)
	call PrintChar
	call DoCallDe
	ld a, (ix+1)
	call PrintChar
ret

DoCallDe:
	push de
ret

SquareBrackets: db '[]'
CurlyBrackets: db '{}'

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