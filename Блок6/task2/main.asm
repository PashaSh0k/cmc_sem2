include console.inc
public A, B, Z
extern Mult@0: near, multi: near

.data
A dd ?
B dd ?
Z dq ?

.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_2 (����_6) "������������ ���������"'
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
