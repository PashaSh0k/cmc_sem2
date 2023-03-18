include console.inc
.data

.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_5)'
    outstr 'input number = '
    xor EAX, EAX
L: 
    inchar DL
    cmp DL, ' '
    jE fininp
    sub DL, '0'
    shl EAX, 1
    or AL, DL
    jmp L
    
fininp:
    cmp EAX, 0
    jE null
    mov ECX, 32
L1:
    xor DL, DL
    shl EAX, 1
    adc DL, 0
    cmp DL, 0
    loopz L1
    
outp:
    outword DL
    xor DL, DL
    shl EAX, 1
    adc DL, 0
    loop outp
    outword DL
    jmp temp
  
null:
    outchar '0'
temp:
    newline
    pause 'Press any key to exit'
    exit
end Start
