include console.inc
.data
N dd ?
.code
MaxDig proc
    push EBP
    mov EBP, ESP
    push EBX
    push EDX
    
    mov EBX, [EBP+8]
    cmp EBX, 0
    jE @fin
    push EAX
    mov EAX, EBX
    xor EDX, EDX
    mov EBX, 10
    div EBX
    mov EBX, EAX
    pop EAX
    cmp EDX, EAX
    jB @skip
    mov EAX, EDX
@skip:
    push EBX
    call MaxDig
@fin:
    pop EDX
    pop EBX
    pop EBP
    ret 4
MaxDig endp
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_5 (блок_4) "Максимальная цифра в десятичной записи числа"'
    inint N, 'Input number = '
    mov EBX, N
    push EBX
    mov EAX, 0
    call MaxDig
    outstr 'Max numeral is '
    outintln EAX
    pause 'Press any key to exit'
    exit
end Start
