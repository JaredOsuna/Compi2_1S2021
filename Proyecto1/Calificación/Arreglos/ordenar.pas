program Ordenar;

const 
	maximo = 100; 
	maxVal = 30000;

var 
	datos: array[1..maximo] of integer;      
   i: integer;                            
 
procedure swap(var a,b: integer); 
var 
	tmp: integer; 
begin 
	tmp := a; 
   	a := b; 
   	b := tmp; 
end;
 
procedure generaNumeros();               { Genera números aleatorios } 
begin 
	writeln; 
   	writeln('Generando números...'); 
   	for i := 1 to maximo do 
    	datos[i] := maximo - i * i ; 
end;
 
procedure muestraNumeros();              { Muestra los núms almacenados } 
begin 
	writeln; 
   	writeln('Los números son...'); 
   	for i := 1 to maximo do 
    	write(datos[i], ' '); 
   	writeln(''); 
end; 
 
procedure Burbuja();                     { Ordena según burbuja } 
var 
	cambiado: boolean; 
begin 
	writeln(''); 
   	writeln('Ordenando mediante burbuja...'); 
   	repeat 
     	cambiado := false;                 	{ No cambia nada aún } 
     	for i := maximo downto 2 do        	{ De final a principio } 
       		if datos[i] < datos[i-1] then   { Si está colocado al revés } 
         	begin 
         		swap(datos[i], datos[i-1]);    { Le da la vuelta } 
         		cambiado := true;              { Y habrá que seguir mirando } 
         	end; 
	until not cambiado;                  { Hasta q nada se haya cambiado } 
 end;
 

procedure Sort(l, r: Integer);         { Esta es la parte recursiva } 
var 
	i, j, x, y: integer; 
begin 
	i := l; j := r;                      { Límites por los lados } 
   	x := datos[(l+r) DIV 2];             { Centro de la comparaciones } 
   	repeat 
     	while datos[i] < x do i := i + 1;  { Salta los ya colocados } 
     	while x < datos[j] do j := j - 1;  {   en ambos lados } 
     
	 	if i <= j then                     { Si queda alguno sin colocar } 
       	begin 
       		swap(datos[i], datos[j]);  	{ Los cambia de lado } 
       		i := i + 1; 
			j := j - 1;          		{ Y sigue acercándose al centro } 
       	end; 
   until i > j;                         { Hasta que lo pasemos } 
   
   if l < j then Sort(l, j);            { Llamadas recursivas por cada } 
   if i < r then Sort(i, r);            {   lado } 
 end; 
 
procedure QuickSort();                   { Ordena según Quicksort } 
begin
	writeln('');
	writeln('Ordenando mediante QuickSort...'); 
	Sort(1,Maximo);
end;
 
 
 begin 
   generaNumeros(); 
   muestraNumeros(); 
   Burbuja(); 
   muestraNumeros(); 

   generaNumeros(); 
   muestraNumeros(); 
   QuickSort(); 
   muestraNumeros(); 
end.
{

Generando números...

Los números son...
99 96 91 84 75 64 51 36 19 0 -21 -44 -69 -96 -125 -156 -189 -224 -261 -300 -341 -384 -429 -476 -525 -576 -629 -684 -741 -800 -861 -924 -989 -1056 -1125 -1196 -1269 -1344 -1421 -1500 -1581 -1664 -1749 -1836 -1925 -2016 -2109 -2204 -2301 -2400 -2501 -2604 -2709 -2816 -2925 -3036 -3149 -3264 -3381 -3500 -3621 -3744 -3869 -3996 -4125 -4256 -4389 -4524 -4661 -4800 -4941 -5084 -5229 -5376 -5525 -5676 -5829 -5984 -6141 -6300 -6461 -6624 -6789 -6956 -7125 -7296 -7469 -7644 -7821 -8000 -8181 -8364 -8549 -8736 -8925 -9116 -9309 -9504 -9701 -9900 

Ordenando mediante burbuja...

Los números son...
-9900 -9701 -9504 -9309 -9116 -8925 -8736 -8549 -8364 -8181 -8000 -7821 -7644 -7469 -7296 -7125 -6956 -6789 -6624 -6461 -6300 -6141 -5984 -5829 -5676 -5525 -5376 -5229 -5084 -4941 -4800 -4661 -4524 -4389 -4256 -4125 -3996 -3869 -3744 -3621 -3500 -3381 -3264 -3149 -3036 -2925 -2816 -2709 -2604 -2501 -2400 -2301 -2204 -2109 -2016 -1925 -1836 -1749 -1664 -1581 -1500 -1421 -1344 -1269 -1196 -1125 -1056 -989 -924 -861 -800 -741 -684 -629 -576 -525 -476 -429 -384 -341 -300 -261 -224 -189 -156 -125 -96 -69 -44 -21 0 19 36 51 64 75 84 91 96 99 

Generando números...

Los números son...
99 96 91 84 75 64 51 36 19 0 -21 -44 -69 -96 -125 -156 -189 -224 -261 -300 -341 -384 -429 -476 -525 -576 -629 -684 -741 -800 -861 -924 -989 -1056 -1125 -1196 -1269 -1344 -1421 -1500 -1581 -1664 -1749 -1836 -1925 -2016 -2109 -2204 -2301 -2400 -2501 -2604 -2709 -2816 -2925 -3036 -3149 -3264 -3381 -3500 -3621 -3744 -3869 -3996 -4125 -4256 -4389 -4524 -4661 -4800 -4941 -5084 -5229 -5376 -5525 -5676 -5829 -5984 -6141 -6300 -6461 -6624 -6789 -6956 -7125 -7296 -7469 -7644 -7821 -8000 -8181 -8364 -8549 -8736 -8925 -9116 -9309 -9504 -9701 -9900 

Ordenando mediante QuickSort...

Los números son...
-9900 -9701 -9504 -9309 -9116 -8925 -8736 -8549 -8364 -8181 -8000 -7821 -7644 -7469 -7296 -7125 -6956 -6789 -6624 -6461 -6300 -6141 -5984 -5829 -5676 -5525 -5376 -5229 -5084 -4941 -4800 -4661 -4524 -4389 -4256 -4125 -3996 -3869 -3744 -3621 -3500 -3381 -3264 -3149 -3036 -2925 -2816 -2709 -2604 -2501 -2400 -2301 -2204 -2109 -2016 -1925 -1836 -1749 -1664 -1581 -1500 -1421 -1344 -1269 -1196 -1125 -1056 -989 -924 -861 -800 -741 -684 -629 -576 -525 -476 -429 -384 -341 -300 -261 -224 -189 -156 -125 -96 -69 -44 -21 0 19 36 51 64 75 84 91 96 99 

}