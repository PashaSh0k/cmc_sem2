include console.inc
.data
N dd ?
K db ?
.code
OUTD1 proc
    push EAX
    push EBX
    push EDX
    push EBP
    mov EBP, ESP
@L:
    cmp EAX, EBX
    jB @less
    xor EDX, EDX
    div EBX
    push EDX
    jmp @L
@less:
    push EAX
@L1:
    cmp EBP, ESP
    jE @fin
    pop EDX
    outint EDX
    jmp @L1
@fin:
    newline
    pop EBP
    pop EDX
    pop EBX
    pop EAX
    ret
OUTD1 endp

OUTD2 proc
    push EAX
    push EBX
    push EDX
    cmp EAX, EBX
    jAE @next
    outint EAX
    jmp @fin
@next:
    mov EDX, 0
    div EBX
    call OUTD2
    outint EDX
@fin:
    pop EDX
    pop EBX
    pop EAX
    ret
OUTD2 endp
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_4 (блок_4) "Системы счисления"'
    inint N, 'Input number = '
    inint K, 'Input notation = '
    mov EAX, N
    movzx EBX, K
    call OUTD1
    call OUTD2
    newline
    pause 'Press any key to exit'
    exit
end Start
