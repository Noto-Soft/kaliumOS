org 0x0
use16

;
; Kernel
;

main:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov [ebr_drive], dl

    mov ah, 0x2
    mov al, 1
    lea bx, [boot_sector]
    xor ch, ch
    mov cl, 1
    xor dh, dh
    int 0x13

    mov bl, 0x7
    call clear_screen

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
    test al, al
    jz .done
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

lba_to_chs:
    push ax
    push dx

    xor dx, dx
    div word [cs:bpb_sectors_per_track]

    inc dx
    mov cx, dx

    xor dx, dx
    div word [cs:bpb_heads]

    mov dh, dl
    mov ch, al
    shl ah, 6
    or cl, ah
    pop ax
    mov dl, al
    pop ax
    ret

disk_read:
    push ax
    push bx
    push cx
    push dx
    push disk_read

    push cx
    call lba_to_chs
    pop ax

    mov ah, 0x2
    mov di, 3
.retry:
    pusha
    stc
    int 13h
    jnc .done

    popa
    call disk_reset

    dec di
    test di, di
    jnz .retry
.fail:
    jmp $
.done:
    popa
    
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

disk_reset:
    pusha
    xor ah, ah
    stc
    int 0x13
    jc $
    popa
    ret

drive db 0

cursor_shape dw 0x003f
cursor_position dw 0

kalium_os db "********* kaliumOS version 0.00.2.3 *********", 0xa, "rich in potassium", 0xa, 0xa, 0

file_boot_txt db "BOOT    TXT"

boot_sector:
    db 3 dup(0)
    bpb_oem_identifier db 8 dup(0)
    bpb_bytes_per_sector dw ?
    bpb_sectors_per_cluster db ?
    bpb_reserved_sectors dw ?
    bpb_fats db ?
    bpb_root_directory_entries dw ?
    bpb_sectors dw ?
    bpb_media_descriptor db ?
    bpb_sectors_per_fat dw ?
    bpb_sectors_per_track dw ?
    bpb_heads dw ?
    bpb_hidden_sectors dd ?
    bpb_large_sector_count dd ?
    ebr_drive db ?
    ebr_nt_flags db ?
    ebr_signature db ?
    ebr_serial dd ?
    ebr_volume_label db 11 dup(0)
    ebr_system_identifier db 8 dup(0)
    db 450 dup(0)

file_buffer: