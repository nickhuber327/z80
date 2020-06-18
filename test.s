ScreenSize equ &4000
start:
  org &8000
  ld hl, &0000
  ld de, &c000
  ld bc, &4000
