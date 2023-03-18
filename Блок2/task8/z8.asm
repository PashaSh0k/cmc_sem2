include console.inc
.data
    N equ 30
    S db N dup(?)
    T db '�� ���������', 0
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_8 (����_2) "���������"'
    mov EDX, offset T
    mov EBX, 0
L:  inchar AL
    cmp AL, '.'
    je L1
    cmp AL, ' '
    je L
    cmp AL, 'Z'             ; sybmol > 'Z'?
    jA inp
    sub AL, 'A'
    add AL, 'a'

inp:
    mov S[EBX], AL
    inc EBX
    jmp L
    
L1: 
    mov EDI, EBX
    mov ESI, -1
    
cycle:
    dec EDI
    inc ESI
    mov AL, S[ESI]
    cmp AL, S[EDI]
    jne fin
    cmp ESI, EDI
    jb cycle
    

    add EDX, 3
fin:outstrln EDX

    pause 'Press any key to exit'
    exit
end Start
