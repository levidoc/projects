section	.text
   global _start     ;must be declared for linker (ld)
_start:             ;tell linker entry point
	
   ;writing the name 'Variable'
   mov	edx,11       ;message length
   mov	ecx, name   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
name db 'Hello World'

;This is as far as i go, i will never call myself an Assembly Developer, You will never see me touch that side of the world. i will never have a program in ASM, i am at peace
