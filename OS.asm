
; Shamelessly stolen from Don

    org 000000000000b
    jp cold_start


; Routines for stuff
current_location: equ 0xdb00
line_count:       equ 0xdb02
byte_count:       equ 0xdb03
value_pointer:    equ 0xdb04
current_value:    equ 0xdb06
buffer:           equ 0xdb08

Stack:            equ 0xdbff


init_port: ld a,04eh
    out (3),a
    ld a,037h
    out (3),a
    ret

write_char: ld b,a
write_char_loop:    in a,(3)
    and 001h
    jp  z,write_char_loop
    ld  a,b
    out (2),a
    ret

write_string:   in  a,(3)
    and 001h
    jp  z,write_string
    ld  a,(hl)
    and a
    ret z
    out (2),a
    inc hl
    jp  write_string

