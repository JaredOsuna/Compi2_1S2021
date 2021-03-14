program nDimensiones;

type
    Reporte_ = object
        var vino:string;
        var revision:string;
        var botella:string;
        var rechazos:integer;
    end;
var
    vinos : array[0..4] of String;
    botellas : array[0..3] of String;
    revisiones : array[0..1] of String;
    reporte : array[0..1, 0..4, 0..3] of Reporte_;

procedure crearArray();
var
    i, j, k : integer;
begin
    for i := 0 to 1 do
    begin
        for j := 0 to 4 do
        begin
            for k := 0 to 3 do
            begin
                reporte[i,j,k].vino := vinos[j];
                reporte[i,j,k].revision := revisiones[i];
                reporte[i,j,k].botella := botellas[k];
                reporte[i,j,k].rechazos := ((i)*4*3) + ((j)*4) + (k + 1);
            end;
        end;
    end;
end;

procedure printStruct(reporte : Reporte_);
begin
    writeln(reporte.revision, '  ', reporte.vino, '  ', reporte.botella, '  ', reporte.rechazos);
end;

procedure printArreglo();
var
    i,j,k : integer;
begin
    for i := 0 to 1 do
    begin
        for j := 0 to 4 do
        begin
            for k := 0 to 3 do
            begin
                printStruct(reporte[i,j,k]);
            end;
        end;
    end;
end;


procedure llenarArreglo();
begin
    vinos[0] := 'Blanco'; 
    vinos[1] := 'Tinto'; 
    vinos[2] := 'Jerez'; 
    vinos[3] := 'Oporto'; 
    vinos[4] := 'Rosado';
    botellas[0] := 'Magnum'; 
    botellas[1] := 'DMagnum'; 
    botellas[2] := 'Estandar'; 
    botellas[3] := 'Imperial';
    revisiones[0] := 'Oxigeno'; 
    revisiones[1] := 'Envases';
end;

begin
    llenarArreglo();
    crearArray();
    writeln('***************************************');
    writeln('***************************************');
    printArreglo();
    writeln('***************************************');
end.

{
***************************************
***************************************
Oxigeno  Blanco  Magnum  1
Oxigeno  Blanco  DMagnum  2
Oxigeno  Blanco  Estandar  3
Oxigeno  Blanco  Imperial  4
Oxigeno  Tinto  Magnum  5
Oxigeno  Tinto  DMagnum  6
Oxigeno  Tinto  Estandar  7
Oxigeno  Tinto  Imperial  8
Oxigeno  Jerez  Magnum  9
Oxigeno  Jerez  DMagnum  10
Oxigeno  Jerez  Estandar  11
Oxigeno  Jerez  Imperial  12
Oxigeno  Oporto  Magnum  13
Oxigeno  Oporto  DMagnum  14
Oxigeno  Oporto  Estandar  15
Oxigeno  Oporto  Imperial  16
Oxigeno  Rosado  Magnum  17
Oxigeno  Rosado  DMagnum  18
Oxigeno  Rosado  Estandar  19
Oxigeno  Rosado  Imperial  20
Envases  Blanco  Magnum  13
Envases  Blanco  DMagnum  14
Envases  Blanco  Estandar  15
Envases  Blanco  Imperial  16
Envases  Tinto  Magnum  17
Envases  Tinto  DMagnum  18
Envases  Tinto  Estandar  19
Envases  Tinto  Imperial  20
Envases  Jerez  Magnum  21
Envases  Jerez  DMagnum  22
Envases  Jerez  Estandar  23
Envases  Jerez  Imperial  24
Envases  Oporto  Magnum  25
Envases  Oporto  DMagnum  26
Envases  Oporto  Estandar  27
Envases  Oporto  Imperial  28
Envases  Rosado  Magnum  29
Envases  Rosado  DMagnum  30
Envases  Rosado  Estandar  31
Envases  Rosado  Imperial  32
***************************************
}