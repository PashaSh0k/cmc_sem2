include console.inc
public X
extern In4@0: near, Out4@0: near, output: near

.data
X dd ?

.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_1 (����_6) "����-����� ������������ �����"'
    push offset X
    call In4@0
    newline
    push X
    call Out4@0
    newline
    jmp output
end Start
