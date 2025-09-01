org 0x0
use16

start:
    mov ax, cs
    mov ds, ax
    mov es, ax
    
    mov ah, 0xe
    xor bh, bh
    lea si, [message]
.loop:
    lodsb
    test al, al
    jz $
    int 0x10
    jmp .loop

message db 0xd, 0xa, "kaliumOS version 0.00.1.0", 0xd, 0xa, "rich in potassium", 0