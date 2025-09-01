mkdir -p build

# assemble binaries
fasm src/bootloader/main.s build/boot.bin
fasm src/kernel/main.s build/kernel.bin

# create disk
dd if=/dev/zero of=kaliumOS.img bs=512 count=2880
mkfs.fat -F 12 -n "kaliumOS" kaliumOS.img
dd if=build/boot.bin of=kaliumOS.img conv=notrunc
mcopy -i kaliumOS.img build/kernel.bin "::kernel.bin"

# test
qemu-system-i386 \
    -drive file=kaliumOS.img,if=floppy,format=raw