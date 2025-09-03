use32
format elf

section '.text'

macro irq_stub labl, ext {
public labl
extrn ext
labl:
    pusha
    call ext
    mov al, 0x20
    out 0x20, al
    out 0xa0, al
    popa
    iret
}

section '.note.GNU-stack'