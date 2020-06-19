PrintChar equ &BB5A

org &8300
	cp 1
	jp nz, ShowUsage
	ld a, '&'
	call PrintChar
	ld a, (ix+1)
	or a
	call nz, ShowHex
	ld a, (ix+0)
	call ShowHex
ret

ShowUsage:
	ld hl, ShowUsageMessage
jp PrintString

ShowUsageMessage:
	defb "Usage: Call &8300, [16 bit number]", 255

ShowHex:
	ld b, 16
	call MathDiv
	push af
		ld a,c
		call PrintHexChar
	pop af
	jp PrintHexChar

PrintHexChar:
	cp 10
	jr c, PrintHexCharNotAtoF
	add 7

PrintHexCharNotAtoF:
	add 48
	jp PrintChar

MathDiv:
	ld c, 0
	cp 0
	ret z

MathDivAgain:
	sub b
	inc c
	jp nc, MathDivAgain
	add b
	dec c
ret

PrintString:
	ld a, (hl)
	cp 255
	ret z
	inc hl
	call PrintChar
jr PrintString