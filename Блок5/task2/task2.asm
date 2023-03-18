include console.inc
.data
    dig16 db '0123456789ABCDEF'
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_2 (блок_5) "Ввод-вывод шестнадцатеричного числа"'
    outstr 'input number = '
    xor EAX, EAX
L: 
    inchar DL
    cmp DL, ' '
    jE fininp
    cmp DL, 'A'
    jB num
    sub DL, 'A'
    add DL, 10
    jmp go
num:
    sub DL, '0'
go:    
    shl EAX, 4
    or AL, DL
    inc ECX
    jmp L
fininp:  
    mov ECX, 8
    mov DL, 0
    cmp EAX, 0
    jE fin
outp:
    rol EAX, 4
    mov EBX, EAX
    and EBX, 1111b
    cmp DL, 0
    jNE print
    cmp dig16[EBX], '0'
    jE skip
print:
    outchar dig16[EBX]
    mov DL, 1
skip:
    dec ECX
    cmp ECX, 0
    jNE outp
    jmp temp
fin:
    outchar '0'
temp:
    newline
    
    pause 'Press any key to exit'
    exit
end Start
