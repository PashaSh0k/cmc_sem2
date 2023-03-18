include console.inc
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_6 (блок_1)'
    inchar AL           ; input symbol
    mov ECX, 5
    sub EDX, EDX        ; result
    
cycle: sub AL, '0'      ; 'n'-'0'
       movzx EBX, AL;   ; EBX := n
       mov EAX, EDX     ; EAX := EDX(res)
       mul ECX;         ; EAX*5
       mov EDX, EAX     ; EDX = EAX*5
       add EDX, EBX     ; EDX = EAX*5+n
       inchar AL        ; input
       cmp AL, ' '      ; if ' ' then break
       je fin
       jmp cycle
       
fin:   outwordln EDX
    
    pause 'Press any key to exit'
    exit
end Start
