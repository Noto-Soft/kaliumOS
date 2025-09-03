CC_LFLAGS="-ffreestanding -m32 -nostdlib -fno-pie -fno-pic"
LD_LFLAGS="-m elf_i386 -nostdlib"

mkdir -p build{/,/kernel}

# assemble binaries
fasm src/bootloader/main.s build/boot.bin
fasm src/kernel/stubs.s build/kernel/stubs.o
fasm src/kernel/idt/stubs.s build/kernel/idtstubs.o

# compile c sources

for file in src/kernel/{,idt/,pic/}*.c; do
    filename=$(basename "$file" .c)
    gcc $CC_LFLAGS -c "$file" -o "build/kernel/$filename.o"
done

# Link all .o files
ld $LD_LFLAGS -Tsrc/kernel/linker.ld build/kernel/*.o -o build/kernel.bin

# create disk
dd if=/dev/zero of=kaliumOS.img bs=512 count=2880
mkfs.fat -F 12 -n "kaliumOS" kaliumOS.img
dd if=build/boot.bin of=kaliumOS.img conv=notrunc
mcopy -i kaliumOS.img build/kernel.bin "::kernel.bin"

# test
qemu-system-i386 \
    -drive file=kaliumOS.img,if=floppy,format=raw \
    -monitor stdio