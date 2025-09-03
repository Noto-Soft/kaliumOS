
build/kernel.o:     file format elf32-i386


Disassembly of section .text:

00000000 <idt_set_descriptor>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
   9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
   c:	88 55 ec             	mov    BYTE PTR [ebp-0x14],dl
   f:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
  12:	0f b6 45 ec          	movzx  eax,BYTE PTR [ebp-0x14]
  16:	c1 e0 03             	shl    eax,0x3
  19:	05 00 01 00 00       	add    eax,0x100
  1e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  21:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  24:	89 c2                	mov    edx,eax
  26:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  29:	66 89 10             	mov    WORD PTR [eax],dx
  2c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  2f:	66 c7 40 02 08 00    	mov    WORD PTR [eax+0x2],0x8
  35:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  38:	0f b6 55 e8          	movzx  edx,BYTE PTR [ebp-0x18]
  3c:	88 50 05             	mov    BYTE PTR [eax+0x5],dl
  3f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  42:	c1 e8 10             	shr    eax,0x10
  45:	89 c2                	mov    edx,eax
  47:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4a:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
  4e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  51:	c6 40 04 00          	mov    BYTE PTR [eax+0x4],0x0
  55:	90                   	nop
  56:	c9                   	leave
  57:	c3                   	ret

00000058 <idt_init>:
  58:	55                   	push   ebp
  59:	89 e5                	mov    ebp,esp
  5b:	83 ec 10             	sub    esp,0x10
  5e:	b8 00 01 00 00       	mov    eax,0x100
  63:	a3 02 09 00 00       	mov    ds:0x902,eax
  68:	66 c7 05 00 09 00 00 	mov    WORD PTR ds:0x900,0x7ff
  6f:	ff 07 
  71:	c6 45 ff 00          	mov    BYTE PTR [ebp-0x1],0x0
  75:	eb 33                	jmp    aa <idt_init+0x52>
  77:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
  7b:	8b 14 85 00 00 00 00 	mov    edx,DWORD PTR [eax*4+0x0]
  82:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
  86:	68 8e 00 00 00       	push   0x8e
  8b:	52                   	push   edx
  8c:	50                   	push   eax
  8d:	e8 fc ff ff ff       	call   8e <idt_init+0x36>
  92:	83 c4 0c             	add    esp,0xc
  95:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
  99:	c6 80 00 00 00 00 01 	mov    BYTE PTR [eax+0x0],0x1
  a0:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
  a4:	83 c0 01             	add    eax,0x1
  a7:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
  aa:	80 7d ff 1f          	cmp    BYTE PTR [ebp-0x1],0x1f
  ae:	76 c7                	jbe    77 <idt_init+0x1f>
  b0:	0f 01 1d 00 09 00 00 	lidtd  ds:0x900
  b7:	fb                   	sti
  b8:	90                   	nop
  b9:	c9                   	leave
  ba:	c3                   	ret
  bb:	90                   	nop

000000bc <isr_stub_0>:
  bc:	eb fe                	jmp    bc <isr_stub_0>

000000be <isr_stub_1>:
  be:	eb fe                	jmp    be <isr_stub_1>

000000c0 <isr_stub_2>:
  c0:	eb fe                	jmp    c0 <isr_stub_2>

000000c2 <isr_stub_3>:
  c2:	eb fe                	jmp    c2 <isr_stub_3>

000000c4 <isr_stub_4>:
  c4:	eb fe                	jmp    c4 <isr_stub_4>

000000c6 <isr_stub_5>:
  c6:	eb fe                	jmp    c6 <isr_stub_5>

000000c8 <isr_stub_6>:
  c8:	eb fe                	jmp    c8 <isr_stub_6>

000000ca <isr_stub_7>:
  ca:	eb fe                	jmp    ca <isr_stub_7>

000000cc <isr_stub_8>:
  cc:	eb fe                	jmp    cc <isr_stub_8>

000000ce <isr_stub_9>:
  ce:	eb fe                	jmp    ce <isr_stub_9>

000000d0 <isr_stub_10>:
  d0:	eb fe                	jmp    d0 <isr_stub_10>

000000d2 <isr_stub_11>:
  d2:	eb fe                	jmp    d2 <isr_stub_11>

000000d4 <isr_stub_12>:
  d4:	eb fe                	jmp    d4 <isr_stub_12>

000000d6 <isr_stub_13>:
  d6:	eb fe                	jmp    d6 <isr_stub_13>

000000d8 <isr_stub_14>:
  d8:	eb fe                	jmp    d8 <isr_stub_14>

000000da <isr_stub_15>:
  da:	eb fe                	jmp    da <isr_stub_15>

000000dc <isr_stub_16>:
  dc:	eb fe                	jmp    dc <isr_stub_16>

000000de <isr_stub_17>:
  de:	eb fe                	jmp    de <isr_stub_17>

000000e0 <isr_stub_18>:
  e0:	eb fe                	jmp    e0 <isr_stub_18>

000000e2 <isr_stub_19>:
  e2:	eb fe                	jmp    e2 <isr_stub_19>

000000e4 <isr_stub_20>:
  e4:	eb fe                	jmp    e4 <isr_stub_20>

000000e6 <isr_stub_21>:
  e6:	eb fe                	jmp    e6 <isr_stub_21>

000000e8 <isr_stub_22>:
  e8:	eb fe                	jmp    e8 <isr_stub_22>

000000ea <isr_stub_23>:
  ea:	eb fe                	jmp    ea <isr_stub_23>

000000ec <isr_stub_24>:
  ec:	eb fe                	jmp    ec <isr_stub_24>

000000ee <isr_stub_25>:
  ee:	eb fe                	jmp    ee <isr_stub_25>

000000f0 <isr_stub_26>:
  f0:	eb fe                	jmp    f0 <isr_stub_26>

000000f2 <isr_stub_27>:
  f2:	eb fe                	jmp    f2 <isr_stub_27>

000000f4 <isr_stub_28>:
  f4:	eb fe                	jmp    f4 <isr_stub_28>

000000f6 <isr_stub_29>:
  f6:	eb fe                	jmp    f6 <isr_stub_29>

000000f8 <isr_stub_30>:
  f8:	eb fe                	jmp    f8 <isr_stub_30>

000000fa <isr_stub_31>:
  fa:	eb fe                	jmp    fa <isr_stub_31>

000000fc <inb>:
  fc:	55                   	push   ebp
  fd:	89 e5                	mov    ebp,esp
  ff:	83 ec 14             	sub    esp,0x14
 102:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 105:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 109:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10d:	89 c2                	mov    edx,eax
 10f:	ec                   	in     al,dx
 110:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 113:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
 117:	c9                   	leave
 118:	c3                   	ret

00000119 <pokec>:
 119:	55                   	push   ebp
 11a:	89 e5                	mov    ebp,esp
 11c:	83 ec 0c             	sub    esp,0xc
 11f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
 122:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 125:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 128:	88 4d fc             	mov    BYTE PTR [ebp-0x4],cl
 12b:	88 55 f8             	mov    BYTE PTR [ebp-0x8],dl
 12e:	66 89 45 f4          	mov    WORD PTR [ebp-0xc],ax
 132:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
 136:	c1 e0 08             	shl    eax,0x8
 139:	89 c2                	mov    edx,eax
 13b:	66 0f be 45 fc       	movsx  ax,BYTE PTR [ebp-0x4]
 140:	09 c2                	or     edx,eax
 142:	0f b7 45 f4          	movzx  eax,WORD PTR [ebp-0xc]
 146:	01 c0                	add    eax,eax
 148:	05 00 80 0b 00       	add    eax,0xb8000
 14d:	66 89 10             	mov    WORD PTR [eax],dx
 150:	90                   	nop
 151:	c9                   	leave
 152:	c3                   	ret

00000153 <puts>:
 153:	55                   	push   ebp
 154:	89 e5                	mov    ebp,esp
 156:	53                   	push   ebx
 157:	83 ec 18             	sub    esp,0x18
 15a:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 15d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 160:	88 55 e8             	mov    BYTE PTR [ebp-0x18],dl
 163:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 167:	0f b7 45 e4          	movzx  eax,WORD PTR [ebp-0x1c]
 16b:	66 89 45 fa          	mov    WORD PTR [ebp-0x6],ax
 16f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 176:	eb 30                	jmp    1a8 <puts+0x55>
 178:	0f b7 4d fa          	movzx  ecx,WORD PTR [ebp-0x6]
 17c:	0f b6 55 e8          	movzx  edx,BYTE PTR [ebp-0x18]
 180:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
 183:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 186:	01 d8                	add    eax,ebx
 188:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 18b:	0f be c0             	movsx  eax,al
 18e:	51                   	push   ecx
 18f:	52                   	push   edx
 190:	50                   	push   eax
 191:	e8 fc ff ff ff       	call   192 <puts+0x3f>
 196:	83 c4 0c             	add    esp,0xc
 199:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
 19d:	83 c0 01             	add    eax,0x1
 1a0:	66 89 45 fa          	mov    WORD PTR [ebp-0x6],ax
 1a4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1a8:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1ae:	01 d0                	add    eax,edx
 1b0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1b3:	84 c0                	test   al,al
 1b5:	75 c1                	jne    178 <puts+0x25>
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1bc:	c9                   	leave
 1bd:	c3                   	ret

000001be <int0x21_c>:
 1be:	55                   	push   ebp
 1bf:	89 e5                	mov    ebp,esp
 1c1:	83 ec 10             	sub    esp,0x10
 1c4:	6a 60                	push   0x60
 1c6:	e8 31 ff ff ff       	call   fc <inb>
 1cb:	83 c4 04             	add    esp,0x4
 1ce:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 1d1:	0f be 45 ff          	movsx  eax,BYTE PTR [ebp-0x1]
 1d5:	68 40 01 00 00       	push   0x140
 1da:	6a 0e                	push   0xe
 1dc:	50                   	push   eax
 1dd:	e8 fc ff ff ff       	call   1de <int0x21_c+0x20>
 1e2:	83 c4 0c             	add    esp,0xc
 1e5:	90                   	nop
 1e6:	c9                   	leave
 1e7:	c3                   	ret

000001e8 <kernel>:
 1e8:	55                   	push   ebp
 1e9:	89 e5                	mov    ebp,esp
 1eb:	83 ec 18             	sub    esp,0x18
 1ee:	c7 45 f0 00 80 0b 00 	mov    DWORD PTR [ebp-0x10],0xb8000
 1f5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1fc:	eb 14                	jmp    212 <kernel+0x2a>
 1fe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 201:	8d 14 00             	lea    edx,[eax+eax*1]
 204:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 207:	01 d0                	add    eax,edx
 209:	66 c7 00 20 0f       	mov    WORD PTR [eax],0xf20
 20e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 212:	81 7d f4 cf 07 00 00 	cmp    DWORD PTR [ebp-0xc],0x7cf
 219:	7e e3                	jle    1fe <kernel+0x16>
 21b:	6a 00                	push   0x0
 21d:	6a 0f                	push   0xf
 21f:	68 80 00 00 00       	push   0x80
 224:	e8 fc ff ff ff       	call   225 <kernel+0x3d>
 229:	83 c4 0c             	add    esp,0xc
 22c:	6a 50                	push   0x50
 22e:	6a 0f                	push   0xf
 230:	68 8a 00 00 00       	push   0x8a
 235:	e8 fc ff ff ff       	call   236 <kernel+0x4e>
 23a:	83 c4 0c             	add    esp,0xc
 23d:	83 ec 04             	sub    esp,0x4
 240:	68 8e 00 00 00       	push   0x8e
 245:	68 00 00 00 00       	push   0x0
 24a:	6a 21                	push   0x21
 24c:	e8 fc ff ff ff       	call   24d <kernel+0x65>
 251:	83 c4 10             	add    esp,0x10
 254:	e8 fc ff ff ff       	call   255 <kernel+0x6d>
 259:	83 ec 04             	sub    esp,0x4
 25c:	6a 57                	push   0x57
 25e:	6a 0f                	push   0xf
 260:	68 91 00 00 00       	push   0x91
 265:	e8 fc ff ff ff       	call   266 <kernel+0x7e>
 26a:	83 c4 10             	add    esp,0x10
 26d:	83 ec 04             	sub    esp,0x4
 270:	68 a0 00 00 00       	push   0xa0
 275:	6a 0f                	push   0xf
 277:	68 94 00 00 00       	push   0x94
 27c:	e8 fc ff ff ff       	call   27d <kernel+0x95>
 281:	83 c4 10             	add    esp,0x10
 284:	83 ec 08             	sub    esp,0x8
 287:	6a 28                	push   0x28
 289:	6a 20                	push   0x20
 28b:	e8 fc ff ff ff       	call   28c <kernel+0xa4>
 290:	83 c4 10             	add    esp,0x10
 293:	83 ec 04             	sub    esp,0x4
 296:	68 a7 00 00 00       	push   0xa7
 29b:	6a 0f                	push   0xf
 29d:	68 91 00 00 00       	push   0x91
 2a2:	e8 fc ff ff ff       	call   2a3 <kernel+0xbb>
 2a7:	83 c4 10             	add    esp,0x10
 2aa:	90                   	nop
 2ab:	eb fd                	jmp    2aa <kernel+0xc2>

000002ad <inb>:
 2ad:	55                   	push   ebp
 2ae:	89 e5                	mov    ebp,esp
 2b0:	83 ec 14             	sub    esp,0x14
 2b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 2b6:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 2ba:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 2be:	89 c2                	mov    edx,eax
 2c0:	ec                   	in     al,dx
 2c1:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 2c4:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
 2c8:	c9                   	leave
 2c9:	c3                   	ret

000002ca <outb>:
 2ca:	55                   	push   ebp
 2cb:	89 e5                	mov    ebp,esp
 2cd:	83 ec 08             	sub    esp,0x8
 2d0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 2d3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 2d6:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
 2da:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
 2dd:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
 2e1:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
 2e5:	ee                   	out    dx,al
 2e6:	90                   	nop
 2e7:	c9                   	leave
 2e8:	c3                   	ret

000002e9 <io_wait>:
 2e9:	55                   	push   ebp
 2ea:	89 e5                	mov    ebp,esp
 2ec:	6a 00                	push   0x0
 2ee:	68 80 00 00 00       	push   0x80
 2f3:	e8 d2 ff ff ff       	call   2ca <outb>
 2f8:	83 c4 08             	add    esp,0x8
 2fb:	90                   	nop
 2fc:	c9                   	leave
 2fd:	c3                   	ret

000002fe <PIC_sendEOI>:
 2fe:	55                   	push   ebp
 2ff:	89 e5                	mov    ebp,esp
 301:	83 ec 04             	sub    esp,0x4
 304:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 307:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 30a:	80 7d fc 07          	cmp    BYTE PTR [ebp-0x4],0x7
 30e:	76 0f                	jbe    31f <PIC_sendEOI+0x21>
 310:	6a 20                	push   0x20
 312:	68 a0 00 00 00       	push   0xa0
 317:	e8 ae ff ff ff       	call   2ca <outb>
 31c:	83 c4 08             	add    esp,0x8
 31f:	6a 20                	push   0x20
 321:	6a 20                	push   0x20
 323:	e8 a2 ff ff ff       	call   2ca <outb>
 328:	83 c4 08             	add    esp,0x8
 32b:	90                   	nop
 32c:	c9                   	leave
 32d:	c3                   	ret

0000032e <PIC_remap>:
 32e:	55                   	push   ebp
 32f:	89 e5                	mov    ebp,esp
 331:	6a 11                	push   0x11
 333:	6a 20                	push   0x20
 335:	e8 90 ff ff ff       	call   2ca <outb>
 33a:	83 c4 08             	add    esp,0x8
 33d:	e8 a7 ff ff ff       	call   2e9 <io_wait>
 342:	6a 11                	push   0x11
 344:	68 a0 00 00 00       	push   0xa0
 349:	e8 7c ff ff ff       	call   2ca <outb>
 34e:	83 c4 08             	add    esp,0x8
 351:	e8 93 ff ff ff       	call   2e9 <io_wait>
 356:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 359:	0f b6 c0             	movzx  eax,al
 35c:	50                   	push   eax
 35d:	6a 21                	push   0x21
 35f:	e8 66 ff ff ff       	call   2ca <outb>
 364:	83 c4 08             	add    esp,0x8
 367:	e8 7d ff ff ff       	call   2e9 <io_wait>
 36c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 36f:	0f b6 c0             	movzx  eax,al
 372:	50                   	push   eax
 373:	68 a1 00 00 00       	push   0xa1
 378:	e8 4d ff ff ff       	call   2ca <outb>
 37d:	83 c4 08             	add    esp,0x8
 380:	e8 64 ff ff ff       	call   2e9 <io_wait>
 385:	6a 04                	push   0x4
 387:	6a 21                	push   0x21
 389:	e8 3c ff ff ff       	call   2ca <outb>
 38e:	83 c4 08             	add    esp,0x8
 391:	e8 53 ff ff ff       	call   2e9 <io_wait>
 396:	6a 02                	push   0x2
 398:	68 a1 00 00 00       	push   0xa1
 39d:	e8 28 ff ff ff       	call   2ca <outb>
 3a2:	83 c4 08             	add    esp,0x8
 3a5:	e8 3f ff ff ff       	call   2e9 <io_wait>
 3aa:	6a 01                	push   0x1
 3ac:	6a 21                	push   0x21
 3ae:	e8 17 ff ff ff       	call   2ca <outb>
 3b3:	83 c4 08             	add    esp,0x8
 3b6:	e8 2e ff ff ff       	call   2e9 <io_wait>
 3bb:	6a 01                	push   0x1
 3bd:	68 a1 00 00 00       	push   0xa1
 3c2:	e8 03 ff ff ff       	call   2ca <outb>
 3c7:	83 c4 08             	add    esp,0x8
 3ca:	e8 1a ff ff ff       	call   2e9 <io_wait>
 3cf:	6a 00                	push   0x0
 3d1:	6a 21                	push   0x21
 3d3:	e8 f2 fe ff ff       	call   2ca <outb>
 3d8:	83 c4 08             	add    esp,0x8
 3db:	6a 00                	push   0x0
 3dd:	68 a1 00 00 00       	push   0xa1
 3e2:	e8 e3 fe ff ff       	call   2ca <outb>
 3e7:	83 c4 08             	add    esp,0x8
 3ea:	90                   	nop
 3eb:	c9                   	leave
 3ec:	c3                   	ret

000003ed <IRQ_set_mask>:
 3ed:	55                   	push   ebp
 3ee:	89 e5                	mov    ebp,esp
 3f0:	53                   	push   ebx
 3f1:	83 ec 14             	sub    esp,0x14
 3f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3f7:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
 3fa:	80 7d e8 07          	cmp    BYTE PTR [ebp-0x18],0x7
 3fe:	77 08                	ja     408 <IRQ_set_mask+0x1b>
 400:	66 c7 45 fa 21 00    	mov    WORD PTR [ebp-0x6],0x21
 406:	eb 0a                	jmp    412 <IRQ_set_mask+0x25>
 408:	66 c7 45 fa a1 00    	mov    WORD PTR [ebp-0x6],0xa1
 40e:	80 6d e8 08          	sub    BYTE PTR [ebp-0x18],0x8
 412:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
 416:	50                   	push   eax
 417:	e8 91 fe ff ff       	call   2ad <inb>
 41c:	83 c4 04             	add    esp,0x4
 41f:	89 c3                	mov    ebx,eax
 421:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
 425:	ba 01 00 00 00       	mov    edx,0x1
 42a:	89 c1                	mov    ecx,eax
 42c:	d3 e2                	shl    edx,cl
 42e:	89 d0                	mov    eax,edx
 430:	09 d8                	or     eax,ebx
 432:	88 45 f9             	mov    BYTE PTR [ebp-0x7],al
 435:	0f b6 55 f9          	movzx  edx,BYTE PTR [ebp-0x7]
 439:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
 43d:	52                   	push   edx
 43e:	50                   	push   eax
 43f:	e8 86 fe ff ff       	call   2ca <outb>
 444:	83 c4 08             	add    esp,0x8
 447:	90                   	nop
 448:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 44b:	c9                   	leave
 44c:	c3                   	ret

0000044d <IRQ_clear_mask>:
 44d:	55                   	push   ebp
 44e:	89 e5                	mov    ebp,esp
 450:	53                   	push   ebx
 451:	83 ec 14             	sub    esp,0x14
 454:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 457:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
 45a:	80 7d e8 07          	cmp    BYTE PTR [ebp-0x18],0x7
 45e:	77 08                	ja     468 <IRQ_clear_mask+0x1b>
 460:	66 c7 45 fa 21 00    	mov    WORD PTR [ebp-0x6],0x21
 466:	eb 0a                	jmp    472 <IRQ_clear_mask+0x25>
 468:	66 c7 45 fa a1 00    	mov    WORD PTR [ebp-0x6],0xa1
 46e:	80 6d e8 08          	sub    BYTE PTR [ebp-0x18],0x8
 472:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
 476:	50                   	push   eax
 477:	e8 31 fe ff ff       	call   2ad <inb>
 47c:	83 c4 04             	add    esp,0x4
 47f:	89 c3                	mov    ebx,eax
 481:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
 485:	ba 01 00 00 00       	mov    edx,0x1
 48a:	89 c1                	mov    ecx,eax
 48c:	d3 e2                	shl    edx,cl
 48e:	89 d0                	mov    eax,edx
 490:	f7 d0                	not    eax
 492:	21 d8                	and    eax,ebx
 494:	88 45 f9             	mov    BYTE PTR [ebp-0x7],al
 497:	0f b6 55 f9          	movzx  edx,BYTE PTR [ebp-0x7]
 49b:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
 49f:	52                   	push   edx
 4a0:	50                   	push   eax
 4a1:	e8 24 fe ff ff       	call   2ca <outb>
 4a6:	83 c4 08             	add    esp,0x8
 4a9:	90                   	nop
 4aa:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 4ad:	c9                   	leave
 4ae:	c3                   	ret

000004af <__pic_get_irq_reg>:
 4af:	55                   	push   ebp
 4b0:	89 e5                	mov    ebp,esp
 4b2:	53                   	push   ebx
 4b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 4b6:	0f b6 c0             	movzx  eax,al
 4b9:	50                   	push   eax
 4ba:	6a 20                	push   0x20
 4bc:	e8 09 fe ff ff       	call   2ca <outb>
 4c1:	83 c4 08             	add    esp,0x8
 4c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 4c7:	0f b6 c0             	movzx  eax,al
 4ca:	50                   	push   eax
 4cb:	68 a0 00 00 00       	push   0xa0
 4d0:	e8 f5 fd ff ff       	call   2ca <outb>
 4d5:	83 c4 08             	add    esp,0x8
 4d8:	68 a0 00 00 00       	push   0xa0
 4dd:	e8 cb fd ff ff       	call   2ad <inb>
 4e2:	83 c4 04             	add    esp,0x4
 4e5:	0f b6 c0             	movzx  eax,al
 4e8:	c1 e0 08             	shl    eax,0x8
 4eb:	89 c3                	mov    ebx,eax
 4ed:	6a 20                	push   0x20
 4ef:	e8 b9 fd ff ff       	call   2ad <inb>
 4f4:	83 c4 04             	add    esp,0x4
 4f7:	0f b6 c0             	movzx  eax,al
 4fa:	09 d8                	or     eax,ebx
 4fc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 4ff:	c9                   	leave
 500:	c3                   	ret

00000501 <pic_get_irr>:
 501:	55                   	push   ebp
 502:	89 e5                	mov    ebp,esp
 504:	6a 0a                	push   0xa
 506:	e8 a4 ff ff ff       	call   4af <__pic_get_irq_reg>
 50b:	83 c4 04             	add    esp,0x4
 50e:	c9                   	leave
 50f:	c3                   	ret

00000510 <pic_get_isr>:
 510:	55                   	push   ebp
 511:	89 e5                	mov    ebp,esp
 513:	6a 0b                	push   0xb
 515:	e8 95 ff ff ff       	call   4af <__pic_get_irq_reg>
 51a:	83 c4 04             	add    esp,0x4
 51d:	c9                   	leave
 51e:	c3                   	ret
 51f:	90                   	nop

00000520 <int0x21>:
 520:	60                   	pusha
 521:	e8 fc ff ff ff       	call   522 <int0x21+0x2>
 526:	61                   	popa
 527:	66 50                	push   ax
 529:	b0 20                	mov    al,0x20
 52b:	e6 20                	out    0x20,al
 52d:	66 58                	pop    ax
 52f:	cf                   	iret

Disassembly of section .entry:

00000000 <start>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 08             	sub    esp,0x8
   6:	e8 fc ff ff ff       	call   7 <start+0x7>
