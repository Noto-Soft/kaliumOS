use32
format elf

public int0x21
extrn int0x21_c
int0x21:
    pusha
    call int0x21_c
    popa
    out 0x20, al
    iret