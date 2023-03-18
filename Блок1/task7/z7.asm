include console.inc
.data
    N dd ?
.code
Start:
    ConsoleTitle 'јксенов ѕавел, 110 группа, «адача_7 (блок_1) У Ѕлижайшее число, кратное семи Ф'
    inint N,'Enter the number: '
    mov EAX, N
    sub EDX, EDX
    mov EBX, 7
    div EBX
    cmp EDX, 3
    jbe outp
    add EAX, 1

outp:   mul EBX
        outwordln EAX

    pause 'Press any key to exit'
    exit
end Start
