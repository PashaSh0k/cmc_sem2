include console.inc
.const

.data
    N dd ? ; N > 1
    S db '���������',0
    T db '�������' ,0
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_2 (����_1)'
    inint N,'Enter the number: '
    mov EAX, N ; EAX := N
    mov EBX, 2
    sub EDX, EDX ; EDX := 0
    mov ESI, offset S ; ESI := '���������'
    div EBX
    mov ECX, EAX; ECX := N div 2
    mov EAX, N ; EAX := N
    mov EBX, 1 
    cmp EAX, 4 ; N < 4?
    jB G ; if N < 4 goto G
    
L:  inc EBX; EBX := EBX + 1
    sub EDX, EDX ; EDX := 0
    div EBX; DIV --> EAX, mod --> EDX
    mov EAX, N ; EAX := N
    cmp EDX, 0 ; EDX = 0?
    je fin ; if N mod X(EBX) = 0 goto fin
    cmp EBX, ECX ; EBX = N div 2?
    jne L; goto L if not equal
    
G:  mov ESI, offset T ; ESI := '�������'
    
fin:    outstrln ESI ; output ESI
    
    pause 'Press any key to exit'
    exit
end Start
