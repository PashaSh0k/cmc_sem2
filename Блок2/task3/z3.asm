include console.inc
.data
    s db 20 dup('-'),0
    k dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_3 (блок_2) "Картинка"'
    inint k, 'input: '
    mov ECX, k
    mov s[ECX],0
L:  mov s[ECX-1],'*'
    outstrln offset s
    dec ECX
    cmp ECX, 0
    jnE L

fin:
    newline
    pause 'Press any key to exit'
    exit
end Start
