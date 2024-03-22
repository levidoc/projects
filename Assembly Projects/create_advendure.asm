section .data
    prompt db "Welcome to the Adventure Game!", 0
    prompt_newline db 10, 0
    prompt1 db "You find yourself standing at a crossroad.", 0
    prompt2 db "What do you do?", 0
    prompt3 db "1. Take the path to the left.", 0
    prompt4 db "2. Take the path to the right.", 0
    prompt5 db "You chose the left path.", 0
    prompt6 db "You chose the right path.", 0
    prompt7 db "Game Over. Thanks for playing!", 0

section .text
    global _start

_start:
    ; Display welcome message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 29
    int 0x80

    ; Display newline
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_newline
    mov edx, 1
    int 0x80

    ; Display story prompt 1
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 28
    int 0x80

    ; Display story prompt 2
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 14
    int 0x80

    ; Display story prompt 3
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 25
    int 0x80

    ; Display story prompt 4
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt4
    mov edx, 26
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, prompt
    mov edx, 2
    int 0x80

    ; Compare user input
    cmp byte [prompt], '1'
    je left_path
    cmp byte [prompt], '2'
    je right_path

exit:
    ; Display game over message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt7
    mov edx, 29
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

left_path:
    ; Display message for left path
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt5
    mov edx, 21
    int 0x80
    jmp exit

right_path:
    ; Display message for right path
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt6
    mov edx, 22
    int 0x80
    jmp exit

;Created Vy THE_LOST_KID
