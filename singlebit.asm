org &8050
	cp 1
	ret nz
	ld b, (ix+1)
	ld c, (ix+0)
	ld hl, &c000

Again:
	ld a, (hl)
	bit 7, b
	jr z, NoAnd
	and c

NoAnd:
	bit 6, b
	jr z, NoOR
	or c

NoOr:
	ld (hl), a
	inc l
	jp nz, Again
	inc h
	jp nz, Again
ret