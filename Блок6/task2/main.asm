include console.inc
public A, B, Z
extern Mult@0: near, multi: near

.data
A dd ?
B dd ?
Z dq ?

.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_2 (блок_6) "Сверхдлинное умножение"'
    inint A, 'A = '
    inint B, 'B = '
    push offset Z
    push B
    push A
    call Mult@0
    outword Z
    newline
    jmp multi
end Start
