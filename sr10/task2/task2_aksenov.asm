include console.inc

COMMENT *

 СТУДЕНТ Аксенов Павел Николаевич     группа 110

 САМОСТОЯТЕЛЬНАЯ РАБОТА 10 (12.04.2021)

 ЗАДАЧА_2 (25 очков)
 
 Пусть на языке Free Pascal даны следующие описания:
 const N = 10;
 type vector = array [1..N] of longint;
 
 Описать процедуру Sum(X,N) со стандартными соглашениями о связях stdcall
 при следующих условиях:
 X - массив типа vector, N - размерность этого массива 
 Процедура преобразует массив Х по следующему правилу: 
 for i:= 1 to N-1 do X[i]:= X[i]+X[N];
 (выход из диапазона longint не контролировать)

 Выписать обращение к этой процедуре для массива Y, описание которого
 дано в секции данных этой программы, а после  обращения к процедуре
  - вывести массив Y после изменений (вывод можно осуществить напрямую, 
  не описывая для этого специальной процедуры, т.к. вывод здесь нужен
  только для контроля правильности работы процедуры Sum).

*
.data
T   db " Аксенов Павел  Задача_2 (с-р 10)",0		
N   = 10
Y   dd 1,-20,300,-4000,50000,-6000000,70000000,-800000000,2000000000,-1 ; с/зн

.code
    sum proc
        push EBP
        mov EBP, ESP
        
        push ESI
        push EDI
        push EDX
        push EAX
        push EBX
        
        mov ESI, [EBP+8]                ; array
        mov EDI, [EBP+12]               ; dimension
        mov EBX, 0
        mov EDX, [ESI+4*EDI-4]          ; last elem
        dec EDI
    @L: 
        cmp EBX, EDI
        je @fin
        mov EAX, [ESI+4*EBX]            ;
        add EAX, EDX                    ; y[i] := y[i] + y[N]
        mov [ESI+4*EBX], EAX            ;
        inc EBX
        jmp @L
    @fin:
        pop EBX
        pop EAX
        pop EDX
        pop EDi
        pop ESI
        mov ESP, EBP
        pop EBP
        ret 4*2
    sum endp
Start:
;	здесь размещаются команды программы
    ConsoleTitle offset T	
    mov ECX, N
    push ECX
    push offset Y
    call sum
    mov EBX, 0
outp:
    cmp EBX, ECX
    je fin
    outint Y[4*EBX]
    outchar ' '
    inc EBX
    jmp outp
fin:    
    pause						; нужно при сдаче по e-mail
    exit						
    end Start
