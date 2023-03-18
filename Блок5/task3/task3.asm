include console.inc
.data
    S db 'несимметрично',0
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_3 (блок_5) "Анализ и преобразование двоичного числа"'
    xor EAX, EAX
    xor ECX, ECX
L:  cmp ECX, 32
    jE fininp
    inchar DL
    cmp DL, ' '
    jE L
    sub DL, '0'
    shl EAX, 1
    or AL, DL
    inc ECX
    jmp L
fininp:
    mov ECX, 32
    xor EBX, EBX
    push EAX
L1: 
    shl EAX, 1
    RCR EBX, 1
    loop L1
    pop EAX
    
    push EAX
    xor EAX, EBX
    cmp EAX, 0
    jNE no
    
    pop EAX
    outstrln offset S+2
    mov ECX, 16
L2:
    rol BX, 1
    jC go
    loop L2
    jmp outp
go:
    and BX, 0FFFEh
    dec ECX
    rol BX, CL
    mov DX, BX
    movzx EBX, BX
    movzx EDX, DX
    mov ECX, 16
    xor EAX, EAX
L3: 
    shl BX, 1
    rcr EAX, 1
    loop L3
    or EAX, EDX
    jmp outp
    
no:
    pop EAX
    outstrln offset S
    mov ESI, EAX
    mov EDI, EAX
    and ESI, 80000000h
    shr ESI, 31
    and EDI, 1h
    shl EDI, 31
    and EAX, 7FFFFFFEh
    or EAX, ESI
    or EAX, EDI
    
outp:
    mov CL, 1
cycle:
    cmp CL, 32
    jA fin
    xor EDX, EDX
    shl EAX, 1
    adc DL, 0
    outword DL
    push EAX
    push EDX
    movzx EAX, CL
    mov EBX, 4
    xor EDX, EDX
    div EBX
    cmp EDX, 0
    jNE skip
    outchar ' '
skip:
    pop EDX
    pop EAX
    inc CL
    jmp cycle
    
fin:
    newline
    pause 'Press any key to exit'
    exit
end Start
