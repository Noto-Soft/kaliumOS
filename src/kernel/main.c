#include <stdint.h>

void kernel_main(void) __attribute__((noreturn));

void __attribute__((noreturn, section(".text.entry"))) start() {
    kernel_main();
}

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

void kernel_main() {
    uint16_t* video_memory = (uint16_t*)0xb8000;
    for (int i = 0; i < 80*25; i++) {
        video_memory[i] = 0x0f00 | ' ';
    }
    puts("GDT...",0xf,0);
    puts("OK!",0xa,6);

    for (;;) {}
}