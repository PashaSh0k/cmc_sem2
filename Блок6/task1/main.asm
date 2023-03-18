include console.inc
public X
extern In4@0: near, Out4@0: near, output: near

.data
X dd ?

.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_6) "Ввод-вывод четверичного числа"'
    push offset X
    call In4@0
    newline
    push X
    call Out4@0
    newline
    jmp output
end Start
