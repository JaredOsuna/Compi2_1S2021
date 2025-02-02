program Funciones;
function factorial(n: integer): integer;
begin
    if (n = 0) then
        begin
            factorial := 1;
        end
    else
        begin
            factorial := n * factorial(n - 1);
        end; 
end;

function ackermann(m,n: integer): integer;
begin
    if (m = 0) then
        begin
            ackermann := n + 1;
        end
    else if (m>0) AND (n = 0) then
        begin
            ackermann := ackermann(m - 1, 1);
        end
    else
        begin
            ackermann := ackermann(m - 1, ackermann(m,n - 1));
        end;
end;

procedure Hanoi(discos:integer; origen,aux,destino:string);
begin
    if(discos=1) then
        begin
            writeln('Mover Disco de ',origen,' a ',destino)
        end
    else
        Begin
            Hanoi(discos-1,origen,destino,aux);
            writeln('Mover disco de ',origen,' a ',destino);
            Hanoi(discos-1,aux,origen,destino);
        End;
end;

begin
    writeln('1 Factorial');
    writeln(factorial(6));

    writeln('2.1 Ackermann');
    writeln(ackermann(3,1));

    writeln('2.2 Ackermann');
    writeln(ackermann(2,6));
    
    writeln('3 Hanoi');
    Hanoi(3, 'A', 'B', 'C');
end.

{
    1 Factorial
    720
    2.1 Ackermann
    13
    2.2 Ackermann
    15
    3 Hanoi
    Mover Disco de A a C
    Mover disco de A a B
    Mover Disco de C a B
    Mover disco de A a C
    Mover Disco de B a A
    Mover disco de B a C
    Mover Disco de A a C
}
