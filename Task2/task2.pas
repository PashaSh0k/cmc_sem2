program z2;
type
    str = array[1..32] of integer;
    flagi = (carry, overflow, sign, zero);
var
    k, i: integer;
    inf, sup: int64;
    num: array[1..2] of int64;
    b: array[1..2] of str;
    ok: boolean;
    x: char;
    flag: array[flagi] of 0..1;
procedure input; 
begin
    write('Enter the size of the memory cell: ');
    readln(k);
    while (k < 2) or (k > 32) do begin
        write('Please enter a valid size (2..32): ');
        readln(k);
    end;
    inf := -1*round(exp((k-1)*ln(2)));
    sup := round(exp(k*ln(2)))-1;
    writeln('Range of valid numbers is [',inf,'..',sup,']');
    write('Enter two nubmers from the given range: ');
    read(num[1],num[2]);
    while (num[1] < inf) or (num[1] > sup) or (num[2] < inf) or (num[2] > sup) do begin
        write('Invalid numbers, please enter a valid numbers: ');
        read(num[1],num[2]);
    end;
    writeln;
end;
function unsign(var inp:int64): int64;
begin
    if inp < 0 then
        unsign := 1+sup-abs(inp)
    else
        unsign := inp;
end;
function sig(var inp:int64): int64;
var
    absolut: int64;
begin
    absolut := unsign(inp);
    if inp < abs(inf) then
        sig := inp
    else
        sig := absolut-sup-1;
end;
function Binary(var inp:int64): str;
var
    j: integer;
    r: str;
    ch: int64;
begin
    ch := inp;
    if ch < 0 then
        ch := 1+sup-abs(ch);
    for j := k downto 1 do begin
        r[j] := ch mod 2;
        ch := ch div 2;
    end;
    Binary := r;
end;
procedure table;
var
    j: integer;
begin
    writeln(' ': 12, 'Binary':k, ' Unsigned':k+1, ' Signed':k+1);
    write('1st number: ': 10);
    for j := 1 to k do 
        write(b[1][j]);
    write(' ', unsign(num[1]):k, ' ', sig(num[1]):k);
    writeln();
    write('2nd number: ': 10);
    for j := 1 to k do
        write(b[2][j]);
    write(' ', unsign(num[2]):k, ' ', sig(num[2]):k);
    writeln;
    writeln;
end;
procedure sum(a,b: str);
var
    s: str;
    unsum, ssum, step: int64;
    un, si: boolean;
    y: array[1..2] of int64;
    i: integer;
begin
    flag[carry] := 0;
    for i := k downto 1 do begin
        s[i] := (a[i]+b[i]+flag[carry]) mod 2;
        if (((a[i]*b[i]) = 1) or ((a[i]*flag[carry]) = 1) or ((b[i]*flag[carry]) = 1)) then
            flag[carry] := 1 else
                flag[carry] := 0;
    end;
    flag[sign] := s[1];
    flag[zero] := 1;
    for i := 1 to k do
        if s[i] <> 0 then
            flag[zero] := 0;
    if ((abs(a[1]-1)*abs(b[1]-1)*s[1]) = 1) or ((a[1]*b[1]*abs(s[1]-1)) = 1) then
        flag[overflow] := 1 else
            flag[overflow] := 0;
    unsum := 0;
    ssum := 0;
    step := 1;
    for i := 1 to k do begin
        unsum := unsum+s[k-i+1]*step;
        step := step*2;
    end;
    step := 1;
    for i := 1 to (k-1) do begin
        ssum := ssum+s[k-i+1]*step;
        step := step*2;
    end;
    if s[1] = 1 then
        ssum := -1*(step - ssum); 
    y := num;
    for i := 1 to 2 do
        if num[i] < 0 then
            num[i] := sup+1-abs(num[i]);
    if (num[1]+num[2]) = unsum then
        un := true
    else
        un := false;
    num := y;
    for i := 1 to 2 do
        if num[i] >= abs(inf) then
            num[i] := num[i]-sup-1;
    if (num[1]+num[2]) = ssum then
        si := true
    else
        si := false;
    for i := 1 to k do 
        write(s[i]);
    write(' ', unsum: k+4, un: 6, ' ', ssum: k+4, si: 6, ' ':k, flag[carry]:3, ' ', flag[overflow]:3, ' ', flag[sign]:3, ' ', flag[zero]:3)
end;
procedure sub(var a,b: str);
var
    s: str;
    unsub, ssub, step: int64;
    un, si: boolean;
    y: array[1..2] of int64;
    i: integer;
begin
    flag[carry] := 0;
    for i := k downto 1 do begin
        s[i] := abs((a[i]-b[i]+flag[carry])) mod 2;
        if (a[i] < b[i]) or (flag[carry]*a[i]*b[i] = 1) or (flag[carry]*abs(a[i]-1)*abs(b[i]-1) = 1) then 
            flag[carry] := 1 
        else
            flag[carry] := 0;
    end;
    flag[sign] := s[1];
    flag[zero] := 1;
    for i := 1 to k do
        if s[i] <> 0 then
            flag[zero] := 0;
    if ((abs(a[1]-1)*b[1]*s[1]) = 1) or ((a[1]*abs(b[1]-1)*abs(s[1]-1)) = 1) then
        flag[overflow] := 1 else
            flag[overflow] := 0;
    unsub := 0;
    ssub := 0;
    step := 1;
    for i := 1 to k do begin
        unsub := unsub+s[k-i+1]*step;
        step := step*2;
    end;
    step := 1;
    for i := 1 to (k-1) do begin
        ssub := ssub+s[k-i+1]*step;
        step := step*2;
    end;
    if s[1] = 1 then
        ssub := -1*(step - ssub); 
    y := num;
    for i := 1 to 2 do
        if num[i] < 0 then
            num[i] := sup+1-abs(num[i]);
    if (num[1]-num[2]) = unsub then
        un := true
    else
        un := false;
    num := y;
    for i := 1 to 2 do
        if num[i] >= abs(inf) then
            num[i] := num[i]-sup-1;
    if (num[1]-num[2]) = ssub then
        si := true
    else
        si := false;
    for i := 1 to k do 
        write(s[i]);
    write(' ', unsub: k+4, un: 6, ' ', ssub: k+4, si: 6, ' ':k, flag[carry]:3, ' ', flag[overflow]:3, ' ', flag[sign]:3, ' ', flag[zero]:3)
end;
procedure realization;
begin
    input;
    for i := 1 to 2 do
        b[i] := Binary(num[i]);
    table;
    write('Binary ':k+4, 'Unsigned': 2*k+2, 'Signed': 2*k+2,' ':k,'CF':5, 'OF':5, 'SF':5, 'ZF':5);
    writeln;
    write('Sum: ');
    sum(b[1],b[2]);
    writeln;
    write('Sub: ');
    sub(b[1],b[2]);
    writeln;
    writeln;
    writeln('Enter "Y" if you want to continue, else enter "N"');
    readln(x);
    while (x <> 'N') and (x <> 'Y') do begin
        write('please enter "Y" or "N": ');
        readln(x);
    end;
    if x = 'Y' then
        ok := true
    else
        ok := false;
end;
begin
    writeln('Aksenov Pavel 110 group task-2');
    ok := true;
    while ok do
        realization;
end.

