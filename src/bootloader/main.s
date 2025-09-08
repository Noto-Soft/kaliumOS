org 0x7c00
use16

; bios parameter block

jmp short start
nop

bpb_oem_identifier db "MSWIN4.1"
bpb_bytes_per_sector dw 512
bpb_sectors_per_cluster db 2
bpb_reserved_sectors dw 1
bpb_fats db 2
bpb_root_directory_entries dw 224
bpb_sectors dw 2880
bpb_media_descriptor db 0xf0
bpb_sectors_per_fat dw 9
bpb_sectors_per_track dw 18
bpb_heads dw 2
bpb_hidden_sectors dd 0
bpb_large_sector_count dd 0

; extended boot record

ebr_drive db 0
ebr_nt_flags db 0
ebr_signature db 0x28
ebr_serial dd 0xdeadbeef
ebr_volume_label db "KALIUMOS   "
ebr_system_identifier db "FAT12   "

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    push es
    push word .after
    retf
.after:
    mov [ebr_drive], dl

    push es
    mov ah, 0x8
    int 0x13
    jc $
    pop es

    and cl, 0x3f
    xor ch, ch
    mov [bpb_sectors_per_track], cx

    inc dh
    mov byte [bpb_heads], dh

    mov ax, [bpb_sectors_per_fat]
    mov bl, [bpb_fats]
    xor bh, bh
    mul bx
    add ax, [bpb_reserved_sectors]
    push ax

    mov ax, [bpb_root_directory_entries]
    shl ax, 5
    xor dx, dx
    div word [bpb_bytes_per_sector]

    test dx, dx
    jz .c1
    inc ax
.c1:
    mov cl, al
    pop ax
    mov dl, [ebr_drive]
    lea bx, [buffer]
    call disk_read

    xor di, di
    xchg bx, di
.search:
    lea si, [file_kernel_bin]
    mov cx, 11
    push di
    repe cmpsb
    pop di
    je .found

    add di, 32
    inc bx
    cmp bx, [bpb_root_directory_entries]
    jl .search

    jmp $
.found:
    mov ax, [di+26]
    mov [kernel_cluster], ax
    
    mov ax, [bpb_reserved_sectors]
    lea bx, [buffer]
    mov cl, byte [bpb_sectors_per_fat]
    mov dl, [ebr_drive]
    call disk_read

    mov bx, KERNEL_SEGMENT
    mov es, bx
    mov bx, KERNEL_OFFSET
.load_loop:
    mov ax, [kernel_cluster]

    add ax, 31

    mov cl, 1
    mov dl, [ebr_drive]
    call disk_read

    add bx, [bpb_bytes_per_sector]

    mov ax, [kernel_cluster]
    mov cx, 3
    mul cx
    mov cx, 2
    div cx

    lea si, [buffer]
    add si, ax
    mov ax, [si]
    
    or dx, dx
    jz .even
.odd:
    shr ax, 4
    jmp .c2
.even:
    and ax, 0xfff
.c2:
    cmp ax, 0xff8
    jae .finish

    mov [kernel_cluster], ax
    jmp .load_loop
.finish:
    mov dl, [ebr_drive]

    jmp KERNEL_SEGMENT:KERNEL_OFFSET

lba_to_chs:
    push ax
    push dx

    xor dx, dx
    div word [bpb_sectors_per_track]

    inc dx
    mov cx, dx

    xor dx, dx
    div word [bpb_heads]

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

file_kernel_bin db "KERNEL  BIN"
kernel_cluster dw 0

KERNEL_SEGMENT = 0x500
KERNEL_OFFSET = 0x0

label buffer

times 510-($-$$) db 0
dw 0xaa55