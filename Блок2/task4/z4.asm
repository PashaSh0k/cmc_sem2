include console.inc
COMMENT *
.data
    n db 10 dup(?), 0
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_4 (блок_2) "Безнаковое 10-е число"'
    inint EAX, 'input: '
    cmp EAX, 0
    jG sign
    jL minus
    outint EAX
    jmp temp
minus:
    outchar '-'
    neg EAX
sign:
    mov EBX, 10
    mov ECX, 9
L:
    sub EDX, EDX
    div EBX
    add EDX, '0'
    mov n[ECX], DL
    cmp EAX, 0
    loopne L
    
fin:
    lea ESI, n
    inc ECX
    add ESI, ECX
    outstrln ESI
    
    
    
temp:   
    newline
    pause 'Press any key to exit'
    exit
end Start
*
.data
        text db 10 dup (?), 0
        nums db '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 4'
        inint EAX, 'Enter the number: '
        mov EBX, 16
        mov ECX, 9;     let it be the modificator
        cmp EAX, 0
        jne cycle
        outint EAX

cycle:  cmp EAX, 0
        je fin
        sub EDX, EDX
        div EBX
        mov DL, nums[EDX]
        mov text[ECX], DL
        dec ECX
        jmp cycle

fin:    lea ESI, text
        inc ECX
        add ESI, ECX
        outstrln ESI

        pause 'Press any key to terminate'


    exit
    end Start