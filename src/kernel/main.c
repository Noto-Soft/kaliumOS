#include <stdint.h>

#include "idt/idt.h"
#include "pic/pic.h"
#include "io/io.h"

__attribute__((noreturn, section(".text.entry")))
void start();

void pokec(char ch, uint8_t format, uint16_t cursor) {
    ((uint16_t*)0xb8000)[cursor] = ((uint16_t)format << 8) | ch;
}

void puts(const char* string, uint8_t format, uint16_t starting) {
    uint16_t c = starting;
    for (int i = 0; string[i] != '\0'; i++) {
        pokec(string[i], format, c);
        c++;
    }
}

void int0x21_c() {
    char pressed = inb(0x60);
    pokec(pressed, 0x0e, 320);
    __asm__ volatile ("iret");
}

extern void int0x21(void);

void start() {
    uint16_t* video_memory = (uint16_t*)0xb8000;
    for (int i = 0; i < 80*25; i++) {
        video_memory[i] = 0x0f00 | ' ';
    }
    puts("GDT... OK",0xf,0);
    puts("IDT...", 0xf, 80);
    // idt_set_descriptor(0x21, int0x21, 0x8e);
    idt_init();
    puts("OK", 0xf, 87);
    puts("PIC...", 0xf, 160);
    PIC_remap(0x20, 0x28);
    puts("OK", 0xf, 167);

    for (;;) {}
}