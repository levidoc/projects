section .data                           ;Data segment
    introduction db '$ - Welcome To My First Assembly Program: ',0ah,0ah
    
    data db 0ah,0ah,'Mufunwa wanga ane Nda mufuna.',0ah,'Ndi ni nwalela lunwalo ulu.',0ah,'Ndo toka midzi.',0ah,'Ndo ima a Huna tshinga tsekisaho.',0ah,'Ndi touvha thavha ya killimajaro.',0ah,' ',0ah,'Ini nitouvha tshisima tsha lwanzhe.',0ah,'Tshielelaho lini na lini.',0ah,'Lufuno lodala sa madi a lwanzhe.',0ah,'Ndi nifuna zwinzhi.',0ah,'Arali ndafa, nada ndinga nga vuwa.',0ah,' ',0ah,'No nakesa.',0ah,'Ahuna anonga ene.',0ah,'Lunako lwanu a luvhambedzwi na tshithu.',0ah,'Lunako lwanu alukoni ukalea.',0ah,'Ndi ngoho ndi anifuna.',0ah,'Ndi nifuna ufhira ipfi funa.',0ah,'',0ah,'',0ah,'Tshirendo nga ndidzulafhi patric munyai',0ah,'Kha vhadiphine nga tshirendo itshi tsha lufuno'
    
    criticism db 0ah,'Look i dont give a f*** wat answer it was you gon see this program to the end',0ah,'As if i gave a feature for you to ignore my work',0ah
   userMsg db '$ - Do you wish to hear a poem: (Y/N)  ' ;Ask the user to enter a number
   lenUserMsg equ $-userMsg             ;The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg                 

section .bss           ;Uninitialized data
   num resb 5
	
section .text          ;Code Segment
   global _start
	
_start:                
    
    
   
   ;Introductions
   mov eax, 4
   mov ebx, 1
   mov ecx, introduction
   mov edx, 44
   int 80h  
   
                        ;User prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ;Read and store the user input
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   mov edx, 5          ;5 bytes (numeric, 1 for sign) of that information
   int 80h
   
   
   ;criticism
   mov eax, 4
   mov ebx, 1
   mov ecx, criticism
   mov edx, 127
   int 80h  
  
    
   ;data
   mov eax, 4
   mov ebx, 1
   mov ecx, data
   mov edx, 540
   int 80h  
    
   ; Exit code
   mov eax, 1
   mov ebx, 0
   int 80h
;Created By THE_LOST_KID
