include console.inc

.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_9 (блок_1)'
    sub EDX, EDX
vne:    inchar AL
        mov BL, AL
        mov CL, AL
vnu:    inchar AL
        cmp AL, '.'
        je check
        cmp AL, ','
        je check
        mov CL, AL
        jmp vnu

check:  cmp BL, CL
        jne point
        inc EDX

point:  cmp AL, ','
        je vne

    outintln EDX

    pause 'Press any key to exit'
    exit
end Start
