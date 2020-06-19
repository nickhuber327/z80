org &8300
	cp 1
	ret nz
	ld a, (ix+1)
	ld hl, SMAND
	cp 1
	jr z, Start
	ld hl, SMOR
	cp 2
	jr z, Start
	ld hl, SMXOR
	cp 3
	jr z, Start

Start:
	ld a, (hl)
	ld (SelfModify), a
	ld a, (ix+0)
	ld (SelfModify+1), a
	ld hl, &c000

AgainD:
	ld a, (hl)

SelfModify:
	nop
	nop
	ld (hl), a
	inc l
	jp nz, AgainD
	inc h
	jp nz, AgainD
ret
SMAND: and 1
SMOR: or 1
SMXOR: xor 1