include console.inc
.const

.data
    S db '���������������',0
    T db '�����������������' ,0
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_3 (����_1)'
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
