org &8000
	ld hl, &c000
AgainE:
	;ld a, (hl)
	ld a, %10101010
	;xor %11111111
	and %11111111
	;or %11111111
	;xor %11110000
	;and %11110000
	;or %11110000
	
	ld (hl), a
	inc l
	jp nz, AgainE
	inc h
	jp nz, AgainE
ret