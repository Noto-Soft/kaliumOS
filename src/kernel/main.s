org 0x0
use16

;
; Kernel
;

main:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov dl, [drive]

    mov ax, 0x3
    int 0x10

    call enable_cursor

    mov bl, 0x7
    lea si, [kalium_os]
    call puts

halt:
    cli
    hlt

enable_cursor:
    push ax
    push cx
    mov ah, 0x1
    mov cx, [cs:cursor_shape]
    int 0x10
    pop cx
    pop ax
    ret

disable_cursor:
    push ax
    push cx
    mov ah, 0x1
    mov cx, 0x2607
    int 0x10
    pop cx
    pop ax
    ret

set_cursor_shape:
    push ax
    mov ah, 0x1
    int 0x10
    mov [cs:cursor_shape], cx
    pop ax
    ret

set_cursor_position:
    push ax
    push bx
    push dx
    mov ah, 0x2
    xor bh, bh
    mov dx, cx
    int 0x10
    mov [cs:cursor_position], cx
    pop dx
    pop bx
    pop ax
    ret

update_cursor_position:
    push ax
    push bx
    push dx
    mov ah, 0x2
    xor bh, bh
    mov dx, [cs:cursor_position]
    int 0x10
    pop dx
    pop bx
    pop ax
    ret

; in:
;   cx - cursor
; out:
;   di - offset
cursor_memory_offset:
    push ax
    push bx
    push cx
    push dx
    xor ah, ah
    mov al, ch
    mov bx, 80
    mul bx
    xor ch, ch
    add ax, cx
    shl ax, 1
    mov di, ax
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; al - char
; bl - formatting byte
; cx - cursor
poke_char:
    push ax
    push es
    mov ah, bl
    push ax
    mov ax, 0xb800
    mov es, ax
    pop ax
    push di
    call cursor_memory_offset
    mov [es:di], ax
    pop di
    pop es
    pop ax
    ret

; al - char
; bl - formatting byte
put_char:
    push ax
    push cx
    push es
    cmp al, 0xa
    je .newline
    cmp al, 0x20
    je .space
    mov ah, bl
    push ax
    mov ax, 0xb800
    mov es, ax
    pop ax
    push di
    mov cx, [cs:cursor_position]
    call cursor_memory_offset
    mov [es:di], ax
    pop di
    inc cl
.check_cursor_stuff:
    cmp cl, 80
    jnae .c1
    xor cl, cl
    inc ch
.check_cursor_stuff2:
    cmp ch, 25
    jnae .c1
    call scroll_screen
.c1:
    mov [cs:cursor_position], cx
    pop es
    pop cx
    pop ax
    ret
.newline:
    mov ch, byte [cs:cursor_position+1]
    inc ch
    xor cl, cl
    jmp .check_cursor_stuff2
.space:
    mov cx, [cs:cursor_position]
    inc cl
    jmp .check_cursor_stuff

putc:
    call put_char
    call update_cursor_position
    ret

puts:
    push ax
    push si
.loop:
    lodsb
    cmp al, 0
    je .done
    call put_char
    jmp .loop
.done:
    call update_cursor_position
    pop si
    pop ax
    ret

; bl - formatting byte
clear_screen:
    push ax
    push cx
    push di
    push es

    cld

    mov ax, 0xb800
    mov es, ax

    xor di, di
    mov cx, 80*26 ; clear an extra row for scrolling purposes
    mov ah, bl
    mov al, 0x20
    rep stosw

    pop es
    pop di
    pop cx
    pop ax
    ret

scroll_screen:
    push ax
    push cx
    push si
    push di
    push ds
    push es

    cld

    mov ax, 0xb800
    mov ds, ax
    mov es, ax

    mov si, 160
    xor di, di
    mov cx, 80*25
    rep movsw

    pop es
    pop ds
    pop di
    pop si
    pop cx
    pop ax
    ret

drive db 0
cursor_shape dw 0x003f
cursor_position dw 0

kalium_os db "kaliumOS version 0.00.2.0", 0xa, "rich in potassium", 0