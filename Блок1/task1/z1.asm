include console.inc
.const
    O dd -1
.data
    N dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_1)'
    inint N,'Enter the number: '
    mov EBX, 3 ; divisor
    mov ECX, 0 ; K
    mov EAX, N ; divident
    
equal:    cmp EAX, 1 ; N = 1?
          je fin ; if n = 1 --> output
          sub EDX, EDX ; EDX := 0
          div EBX; DIV --> EAX, MOD --> EDX
          cmp EDX, 0 ; EDX = 0? N mod 3 = 0?
          jne no ; if not equal goto no
          inc ECX;
          jmp equal; goto equal
          
no: mov ECX, O; K := -1

fin: outintln ECX,, 'Answer : '

    pause 'Press any key to exit'
    exit
end Start
