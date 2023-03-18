include console.inc

.data
MaxSize equ 150
n db ?
m db ?
X dw MaxSize dup(?)
.code
Print proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]    ; address X
    mov ECX, [EBP+12]   ; n
    mov EDX, [EBP+16]   ; m
    
    xor ESI, ESI
    mov EBX, EAX
@out:
    cmp ESI, ECX
    je @fin
    xor EDI, EDI
@outt:
    cmp EDI, EDX
    je @outstr
    outint word ptr [EBX+2*EDI]
    outchar ' '
    inc EDI
    jmp @outt
@outstr:
    newline
    add EBX, EDX
    add EBX, EDX
    inc ESI
    jmp @out
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
Print endp

et1 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]        ; address X
    mov ECX, [EBP+12]       ; n
    mov EDX, [EBP+16]       ; m
    
    xor ESI, ESI
    mov EBX, EAX
@L1:
    cmp ESI, ECX
    jE @fin
    xor EDI, EDI
    mov AX, word ptr [EBX+2*EDI]
@check:
    cmp EDI, EDX
    jE @next
    cmp AX, word ptr [EBX+2*EDI]
    jA @no
    mov AX, word ptr [EBX+2*EDI]
    inc EDI
    jmp @check
@next:
    inc ESI
    outint ESI
    outchar ' '
    dec ESI
@no:
    add EBX, EDX
    add EBX, EDX
    inc ESI
    jmp @L1
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
et1 endp
    
et2 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]        ; address X
    mov ECX, [EBP+12]       ; n
    mov EDX, [EBP+16]       ; m
    
    push EAX
    mov EAX, EDX
    mov EDX, 0
    mov EBX, 2
    div EBX
    mov EDX, EAX            ; m div 2
    pop EAX
    
    xor ESI, ESI
    mov EBX, EAX
@L:
    cmp ESI, ECX
    je @fin
    xor EDI, EDI
    push ESI
@L1:
    cmp EDI, EDX
    je @next
    mov ESI, EBX
    add ESI, [EBP+16]
    add ESI, [EBP+16]
    sub ESI, 2
    sub ESI, EDI
    sub ESI, EDI
    mov AX, word ptr [ESI]
    ; in AX EDI'th element from end
    cmp AX, word ptr [EBX+2*EDI]
    jNE @no
    inc EDI
    jmp @L1
@next:
    pop ESI
    inc ESI
    outint ESI
    outchar ' '
    dec ESI
    push ESI
@no:
    pop ESI
    add EBX, [EBP+16]
    add EBX, [EBP+16]
    inc ESI
    jmp @L
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
et2 endp    

et3 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]        ; address X
    mov ECX, [EBP+12]       ; n
    mov EDX, [EBP+16]       ; m
    
    xor ESI, ESI
@L:
    cmp ESI, EDX
    jE @fin
    xor EDI, EDI
    mov CX, word ptr [EAX+2*ESI]
    mov EBX, EAX
@L1:
    cmp EDI, [EBP+12]
    jE @next
    cmp CX, word ptr [EBX+2*ESI]
    jNE @no
    add EBX, EDX
    add EBX, EDX
    inc EDI
    jmp @L1
@next:
    inc ESI
    outint ESI
    outchar ' '
    dec ESI
@no:
    inc ESI
    jmp @L
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
et3 endp      

et4 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]        ; address X
    mov ECX, [EBP+12]       ; n
    mov EDX, [EBP+16]       ; m
    
    lea EBX, [2*EDX+2]
    xor ESI, ESI
@L:
    cmp ESI, ECX
    jE @fin
    outint word ptr [EAX]
    outchar ' '
    add EAX, EBX
    inc ESI
    jmp @L
    
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
et4 endp   

et5 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EAX, [EBP+8]        ; address X
    mov ECX, [EBP+12]       ; n
    mov EDX, [EBP+16]       ; m
    
    lea EBX, [2*EDX-2]
    xor ESI, ESI
    lea EAX, [EAX+EBX]
@L:
    cmp ESI, ECX
    jE @fin
    outint word ptr [EAX]
    outchar ' '
    add EAX, EBX
    inc ESI
    jmp @L
    
@fin:
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
et5 endp     
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_2 (блок_4) "матрицы (прямоугольные и квадратные)"'
    
L1:
    outstr 'Введите число строк = '
    inint n
    outstr 'Введите число столбцов = '
    inint m
    mov AL, n
    mov BL, m
    mul BL
    cmp AX, MaxSize
    jBE valid
    outstrln "Некорректный ввод, желаете ввести новые значение? (enter 'Y'/'N')"
    inchar AL
    cmp AL, 'Y'
    jE L1
    jmp fin
valid:
    newline
    xor ECX,ECX
inps:
    cmp CL, n
    jE inpsf
    movzx EAX, CL   ; nomer str
    mul m
    add EAX, EAX
    xor EBX, EBX
inpst:
    cmp BL, m
    jE inpstf
    movzx EBX, BL   ; nomer stb
    inint X[EAX+2*EBX]
    inc BL
    jmp inpst
inpstf:
    inc CL
    jmp inps
inpsf:
    flush
    newline
    
    ; print
    movzx EBX, m
    push EBX
    movzx EBX, n
    push EBX
    lea EAX, X
    push EAX
    call Print
    
    ; 1 et
    outstr 'Этап 1: '
    movzx EAX, n
    movzx EBX, m
    lea ECX, X
    push EBX
    push EAX
    push ECX
    call et1
    ; 2 et
    outstr 'Этап 2: '
    push EBX
    push EAX
    push ECX
    call et2
    ; 3 et
    outstr 'Этап 3: '
    push EBX
    push EAX
    push ECX
    call et3
    
    cmp EAX, EBX
    jNE fin
    
    ; 4 et
    outstr 'Этап 4: '
    movzx EAX, n
    movzx EBX, m
    lea ECX, X
    push EBX
    push EAX
    push ECX
    call et4
    ; 5 et
    outstr 'Этап 5: '
    push EBX
    push EAX
    push ECX
    call et5
fin:
    outstrln "Желаете начать работу с новой матрицей? (enter 'Y'/'N')"
    inchar AL
    cmp AL, 'Y'
    jE L1
    
    pause 'Press any key to exit'
    exit
end Start
