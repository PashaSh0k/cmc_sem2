{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
program z1(input, output);
const 
    eps = 0.001;
type
    TF = function(x:real): real;
var
    x12, x13, x23, sq: real;
procedure root(f,g: TF; a, b, eps1: real; var x: real);
var
    cond1, cond2: boolean;
function fg(x: real): real;
begin
    fg := f(x)-g(x);
end;
begin
    cond1 := fg(a) < 0;
    cond2 := fg((a+b)/2) < (fg(a)+fg(b))/2;
    if cond1 = cond2 then begin
        x := b;
        while fg(x)*fg(x+eps1) > 0 do begin
            x := (a*fg(b)-b*fg(a))/(fg(b)-fg(a));
            a := x;
        end
    end else begin
        x := a;
        while fg(x)*fg(x-eps1) > 0 do begin
            x := (a*fg(b)-b*fg(a))/(fg(b)-fg(a));
            b := x;
        end;
    end;
end;
function f1(x: real): real;
begin
    f1 := exp(x*ln(2))+1;
end;
function f2(x: real): real;
begin
    f2 := x*x*x*x*x;
end;
function f3(x: real): real;
begin
    f3 := (1-x)/3;
end;
function integral(f: TF; a, b, eps2: real): real;
var
    n, i: longint; 
    h, s1, s2, s, x: real;
begin
    s := (f(a)+f(b))/2;
    s2 := (b-a)*s;
    n := 1;
    repeat
        s1 := s2;
        n := 2*n;
        h := (b-a)/n;
        x := a+h;
        for i := 1 to (n div 2) do begin
            s := s+f(x);
            x := x+2*h;
        end;
        s2 := h*s;
    until abs(s2-s1)/3 < eps2;
    integral := s2;
end;
begin
    writeln('Аксенов Павел 110 Группа');
    writeln;
    writeln('Задание 1. Вычисление корней уравнений и определённых интегралов.');
    writeln('Номер тройки функции: 1');
    writeln('Название метода поиска корня: хорд');
    writeln('Название метода вычисления определённого интеграла: трапеций');
    writeln;
    root(f1, f2, 1, 2, eps/10, x12);
    root(f2, f3, 0, 1, eps/10, x23);
    root(f1, f3, -3, -2, eps/10, x13);
    writeln(x13:2:4,' ',x23:2:4,' ',x12:3:4);
    sq := integral(f1, x13, x12, eps/10)-integral(f2, x23, x12, eps/10)-integral(f3, x13, x23, eps/10);
    writeln('Площадь = ',sq:2:4);
end.
