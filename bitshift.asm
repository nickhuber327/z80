org &8100
	ld hl, &c000

AgainB:
	ld a, (hl)
	;rra
	;rrc a
	sra a
	;srl a
	ld (hl), a
	inc l
	jp nz, AgainB
	inc h
	jp nz, AgainB
ret

org &8200
	di
	ld hl, &FF00

AgainC:
	ld a, (hl)
	;rla
	;rlc a
	sla a
	;sll a
	ld (hl), a
	dec l
	jp nz, AgainC
	dec h
	ld a,h
	cp &BF
	jp nz, AgainC
ret