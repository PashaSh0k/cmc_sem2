include console.inc
; (“≈—“џ ƒЋя Ё“јѕќ¬ 1,2,3 -  в конце этой программы)
; ќѕ»—јЌ»≈ “»ѕќ¬ («јѕ»—») » (—“–” “”–џ):
; ¬нимание, нельз€ вносить изменени€ в описани€ типов и переменных: 
Date_pack record D:5, M:4, Y:7
Date_unpack struc  ; дата в рамках некоторого столети€
D   db ?           ; день (от 1 до 31)
M   db ?           ; мес€ц (от 1 до 12)
Y   db ?           ; год (от 0 до 99)
Date_unpack ends

; ќѕ»—јЌ»≈ ѕ≈–≈ћ≈ЌЌџ’:
.data
T   db " јксенов ѕавел    Ё“јѕ_1 (выход-4)",0	;	
N   equ 6
D1  Date_pack <>                    ; упакованна€ дата_1
D2  Date_pack <>                    ; упакованна€ дата_2
Arr_of_Rec Date_pack N dup (<>)     ; массив записей (упакованных дат)
Arr_of_Struc Date_unpack N dup (<>) ; массив структур (распакованных дат)

; ќѕ»—јЌ»≈ ѕ–ќ÷≈ƒ”–: 
.code
; -----------------------------------------------------
; procedure In_Rec(var D: Date_pack)
; действие: ввод значений полей D, M, Y записи типа Date_pack
In_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    
    mov EAX, [EBP+8]
    inint BX
    shl BX, D
    or [EAX], BX
    inint BX
    shl BX, M
    or [EAX], BX
    inint BX
    or [EAX], BX
    
    pop EBX
    pop EAX
    pop EBP
    ret 4
In_Rec endp
; -----------------------------------------------------
; function Less(D1, D2: Date_pack): byte
; AL := 1 (если D1<D2, т.е. если дата_1 предшествует дате_2)
; AL := 0 (иначе)
Less proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDI
    push ESI
    
    mov EBX, [EBP+8]        ; D1
    mov ECX, [EBP+12]       ; D2
    mov EDI, EBX
    mov ESI, ECX
    and EBX, mask Y
    and ECX, mask Y
    cmp EBX, ECX
    jL yes
    jA no
    mov EBX, EDI
    mov ECX, ESI
    and EBX, mask M
    and ECX, mask M
    cmp EBX, ECX
    jL yes
    jA no
    and EDI, mask D
    and ESI, mask D
    cmp EDI, ESI
    jL yes
    jmp no
    
yes:
    mov AL, 1
    jmp fin
no:
    mov AL, 0
fin:
    pop ESI
    pop EDI
    pop ECX
    pop EBX
    pop EBP
    ret 4*2
Less endp
; -----------------------------------------------------
; procedure Out_Rec(D: Date_pack)
; действие: вывод значений полей D, M, Y записи типа Date_pack
Out_Rec proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    
    mov EBX, [EBP+8]
    mov ECX, EBX
    and EBX, mask D
    shr EBX, D
    outword EBX
    outchar '.'
    mov EBX, ECX
    and EBX, mask M
    shr EBX, M
    outword EBX
    outchar '.'
    and ECX, mask Y
    outword ECX
    
    pop ECX
    pop EBX
    pop EBP
    ret 4
Out_Rec endp
; -----------------------------------------------------
; function Min_Date(var Arr: array of Date_pack; N: longword): word
; действие: ј’ := минимальна€ дата среди элементов-дат массива Arr
; (минимальна€ - предшествующа€ всем остальным датам)
; ‘ункци€ Min_Date в процессе своей работы дл€ сравнени€ текущего минимума 
; с очередной датой обращаетс€ к ранее отлаженной функции Less(D1,D2)
Min_Date proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push EDI
    push ESI
    
    mov EBX, [EBP+8]
    mov ECX, [EBP+12]
    mov DX, [EBX]
    dec ECX
    mov EDI, 1
cycle:
    movzx EDX, DX
    mov ESI, dword ptr [EBX+EDI*(type Date_pack)]
    push ESI
    push EDX
    call Less
    cmp AL, 0
    jNE LL
    mov DX, [EBX+EDI*(type Date_pack)]
LL: inc EDI
    loop cycle
    
    mov AX, DX
    pop ESI
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4*2
Min_Date endp
; -----------------------------------------------------
; procedure Rec_to_Struс(D_pack: Date_pack; var D_unpack: Date_unpack)
; действие: распаковка даты 
; (из записи типа Date_pack в структуру типа Date_unpack)
Rec_to_Struc proc

Rec_to_Struc endp
; -----------------------------------------------------
; procedure Out_Struc(var D: Date_unpack)
; действие: вывод значений полей D, M, Y структуры типа Date_unpack
Out_Struc proc

Out_Struc endp
; -----------------------------------------------------
; ¬≈ƒ”ўјя „ј—“№ (ќ—Ќќ¬Ќјя ѕ–ќ√–јћћј):
start:	
    ConsoleTitle offset T	
; ----------------------------------------------------- 

; Ё“јѕ 1 (40 очков):
; (10 очков) ввод двух дат D1 и D2 (кажда€ в формате dd.mm.yy)
; решение:
    lea EAX, D1
    push EAX
    call In_Rec
    lea EAX, D2
    push EAX
    call In_Rec
; (20 очков) сравнение двух дат (D1 < D2 ?)
; решение:
    mov EAX, dword ptr D1
    mov EBX, dword ptr D2
    push EBX
    push EAX
    call Less
; (10 очков) вывод результата сравнени€ в виде "D1<D2 is true/false",
; где вместо D1 и D2 должна быть напечатана дата в формате dd.mm.yy
; решение:
    mov EBX, dword ptr D1
    push EBX
    call Out_Rec
    outchar 60
    mov EBX, dword ptr D2
    push EBX
    call Out_Rec
    cmp AL, 0
    je null
    outstr ' is true'
    jmp et2
null:
    outstr ' is false'
et2:
COMMENT ~
; ----------------------------------------------------- 
; Ё“јѕ 2 (50 очков):
; (15 очков) цикл дл€ ввода N дат и сохранени€ их в массиве Arr_of_Rec:
; решение:
    mov ECX, 0
L:  cmp ECX, N
    jE con
    lea EAX, Arr_of_Rec[ECX*type Date_pack]
    push EAX
    call In_Rec
    inc ECX
    jmp L 
con:
; (15 очков) цикл дл€ вывода N дат, хран€щихс€ в массиве Arr_of_Rec
; решение:
    mov ECX, 0
L1: cmp ECX, N
    jE ffin
    mov EAX, dword ptr Arr_of_Rec[ECX*type Date_pack]
    push EAX
    call Out_Rec
    outchar ' '
    inc ECX
    jmp L1
ffin:
; (20 очков) цикл дл€ проверки упор€дочены ли элементы-даты по возрастанию
; решение:
    newline
    mov AL, 1
    mov ECX, 0
    mov EDX, 1
L2:
    cmp AL, 1
    jNE noo
    mov ESI, dword ptr Arr_of_Rec[ECX*(type Date_pack)]
    mov EDI, dword ptr Arr_of_Rec[EDX*(type Date_pack)]
    push EDI
    push ESI
    call Less
    inc ECX
    inc EDX
    cmp ECX, N
    jE yess
    jmp L2
    
noo:
    outstr 'not sorted'
    jmp fffin
yess:
    outstr 'sorted'
fffin:
        

; ----------------------------------------------------- 

; Ё“јѕ 3 (40 очков):
; применение функции Min_Date дл€ поиска наименьшей даты в массиве Arr_of_Rec
; решение:
    mov EBX, N
    push EBX
    lea EAX, Arr_of_Rec
    push EAX
    call Min_Date

; вывод наименьшей даты в виде "dd.mm.yy is minimum"
; решение:
    newline
    movzx EBX, AX
    push EBX
    call Out_Rec
    outstr ' is minimum'
    ~
; ----------------------------------------------------- 
; Ё“јѕ 4 (60 очков):
; (30 очков) цикл движени€ по массиву Arr_of_Rec с целью распаковки дат 
; и сохранени€ их в массиве структур  Arr_of_Struc
; решение:

    
; (30 очков) цикл движени€ по массиву Arr_of_Struc с целью вывода дат 
; на экран (каждую дату - в формате dd.mm.yy)
; решение


; ----------------------------------------------------- 
	
	pause
	exit
	end start
	
“≈—“џ, на которых надо сдавать программу:
---------------------------------------------------------
Ё“јѕ 1
---------------------------------------------------------
1)  10.2.20 13.2.20	   ===>   10.2.20<13.2.20 is true
2)  20.2.20 10.3.20	   ===>   20.2.20<10.3.20 is true  
3)  15.2.20 10.2.21	   ===>   15.2.20<10.2.21 is true  
4)  1.2.3 1.2.3	       ===>   1.2.3<1.2.3 is false
5)  10.2.20 15.1.20	   ===>   10.2.20<15.1.20 is false
6)  9.2.20 10.2.19	   ===>   9.2.20<10.2.19 is false
---------------------------------------------------------
Ё“јѕ 2
---------------------------------------------------------
1)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.20 15.4.20	===> sorted
2)  10.2.19 13.2.19 13.3.19 13.3.19 14.3.20 15.4.2	===> not sorted
3)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.18 15.4.20	===> not sorted
4)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.20 13.3.20	===> not sorted
---------------------------------------------------------
Ё“јѕ 3
---------------------------------------------------------
1)  15.4.20 14.3.19 10.2.19 13.3.19 14.3.20 13.2.19 ===> 10.2.19 is minimum  
2)  15.4.20 14.3.20 14.3.19 13.3.19 13.2.19 10.2.19 ===> 10.2.19 is minimum
3)  10.2.19 15.4.20 14.3.19 14.3.20 13.2.19 13.3.19 ===> 10.2.19 is minimum
---------------------------------------------------------
