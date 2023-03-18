include console.inc
.const

.data
    S db 'Сбалансированно',0
    T db 'Несбалансированно' ,0
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_3 (блок_1)'
    inchar AL, 'Enter text: '
    mov ESI, offset S
    sub EBX, EBX; EBX := 0;
    
L:    cmp AL, '.' ; input '.'?
      je fin ; if input '.' = end of text --> goto fin
      cmp AL, '(' ; inpit '('?
      je open ; if input '(' then goto open
      cmp AL, ')' ; inpit ')'?
      je close ; if input ')' then goto close

check: cmp EBX, 0
       jl no ; if EBX < 0 goto no
       inchar AL
       jmp L
    
open: inc EBX ; EBX := EBX + 1
      jmp check

close: dec EBX ; EBX := EBX - 1
       jmp check
       
fin: cmp EBX, 0
     jne no
     jmp outp

no: mov ESI, offset T

outp: outstrln ESI

    pause 'Press any key to exit'
    exit
end Start
