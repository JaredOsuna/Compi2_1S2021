program matrices;
type
    matriz = array [0..4,0..4] of integer;
	const
		min : integer = 0;
		max : integer = 4;
	var
		matrixR : matriz;
		matrixA, matrixB : matriz;

procedure llenado(var matrixA, matrixB : matriz);
var
	i,j : integer;
begin
	for i := min to max - 1 do
		for j := min to max - 1 do
		begin
			matrixA[i,j] := j * 3 + i;
			matrixB[i,j] := (i*i*i) - j * j;
		end;
end;
procedure printMatrix(var matrix : matriz);
var
	i,j : integer;
begin
	for i := min to max - 1 do
	begin
		for j := min to max - 1 do
			write('    |    ',matrix[i,j]);
		writeln('    |');
	end;
end;
procedure suma(var matrixA, matrixB, matrixR : matriz);
var
	i,j : integer;
begin
	for i:= min to max - 1 do
		for j := min to max - 1 do
		begin
			matrixR[i,j] := matrixA[i,j] + matrixB[i,j];
		end;
end;
procedure sumaFilas(var matrix : matriz);
var
	i,j,aux : integer;
begin
	writeln('                                        R');
	for i := min to max - 1 do
	begin
		aux := 0;
		for j := min to max - 1 do
		begin
			aux := aux + matrix[i,j];
			write('    |    ',matrix[i,j]);
		end;
		writeln('    |    ',aux);
	end;
end;
procedure sumaColumnas(var matrix : matriz);
var
	i,j,aux : integer;
begin
	write('R');
	for i := min to max - 1 do
	begin
		aux := 0;
		for j := min to max - 1 do
		begin
			aux := aux + matrix[j,i];
		end;
		write('    |    ',aux);
	end;
	writeln('');
end;
procedure resta(var matrixA, matrixB, matrixR : matriz);
var
	i,j : integer;
begin
	for i:= min to max - 1 do
		for j := min to max - 1 do
		begin
			matrixR[i,j] := matrixA[i,j] - matrixB[i,j];
		end;
end;
procedure Mult(var matrixA, matrixB, matrixR : matriz);
var
	i,j,k : integer;
begin
	for i:= min to max - 1 do
		for j := min to max - 1 do
			for k := 0 to max - 1 do
				matrixR[i,j] := matrixR[i,j] + matrixA[i,k] * matrixB[k,j];
end;
procedure Transpose(var matrix : matriz);
var
	matrixAux : matriz;
	i,j : integer;
begin
	for i := min to max - 1 do
		for j:= min to max - 1 do
			matrixAux[i,j] := matrix[j,i];

	for i := min to max - 1 do
		for j:= min to max - 1 do
			matrix[i,j] := matrixAux[i,j];
end;
procedure minValue(var matrix : matriz);
var
	i,j,iaux,jaux,temp : integer;
begin
	iaux := min;
	jaux := min;
	temp := matrix[min,min];
	for i := min to max - 1 do
		for j := min to max - 1 do
		if matrix[i,j] < temp then
		begin
			temp := matrix[i,j];
			iaux := i;
			jaux := j;
		end;

	writeln('Min -> [',iaux,',',jaux,'] = ',temp);
end;
procedure maxValue(var matrix : matriz);
var
	i,j,iaux,jaux,temp : integer;
begin
	iaux := min;
	jaux := min;
	temp := matrix[min,min];
	for i := min to max - 1 do
		for j := min to max - 1 do
		if matrix[i,j] > temp then
		begin
			temp := matrix[i,j];
			iaux := i;
			jaux := j;
		end;

	writeln('Max -> [',iaux,',',jaux,'] = ',temp);
end;
procedure sort(var matrix : matriz);
var
	i,j,x,y,aux : integer;
begin
	for i := min to max - 1 do
		for j := min to max - 1 do
			for x := 0 to i do
				for y := 0 to j do
				if matrix[i,j] < matrix[x,y] then
				begin
					aux := matrix[i,j];
					matrix[i,j] := matrix[x,y];
					matrix[x,y] := aux;
				end;
end;
procedure clearMat(var matrix : matriz);
var
	i,j : integer;
begin
	for i := min to max - 1 do
		for j := min to max - 1 do
			matrix[i,j] := 0;
end;
begin
	llenado(matrixA,matrixB);
	writeln('Matrix A');
	printMatrix(matrixA);
	writeln('Matrix B');
	printMatrix(matrixB);

	writeln('MatR = MatA + MatB');
	suma(matrixA,matrixB,matrixR);
	printMatrix(MatrixR);

	{writeln('MatR = MatA - MatB');
		resta(matrixA,matrixB,matrixR);
		printMatrix(MatrixR);}
	
	{writeln('Clear MatR');
		clearMat(matrixR);
		printMatrix(matrixR);}

	{writeln('MatR = MatA * MatB');
		mult(matrixa,matrixb,matrixr);
		printmatrix(matrixr);}

	{writeln('Tranpose(MatA)');
		transpose(matrixA);
		printmatrix(matrixa);}

	minValue(matrixR);
	maxValue(matrixR);

	writeln('Sort MatA');
	sort(matrixR);
	printmatrix(matrixR);

	minValue(matrixR);
	maxValue(matrixR);

	writeln('Suma Filas y Columnas');
	sumaFilas(matrixa);
	sumacolumnas(matrixa);
end.

{
	Matrix A
    |    0    |    -1    |    -4    |    -9    |
    |    1    |    0    |    -3    |    -8    |
    |    8    |    7    |    4    |    -1    |
    |    27    |    26    |    23    |    18    |
Matrix B
    |    0    |    -1    |    -4    |    -9    |
    |    1    |    0    |    -3    |    -8    |
    |    8    |    7    |    4    |    -1    |
    |    27    |    26    |    23    |    18    |
MatR = MatA + MatB
    |    0    |    -2    |    -8    |    -18    |
    |    2    |    0    |    -6    |    -16    |
    |    16    |    14    |    8    |    -2    |
    |    54    |    52    |    46    |    36    |
Min -> [0,3] = -18
Max -> [3,0] = 54
Sort MatA
    |    -18    |    -16    |    -8    |    -6    |
    |    -2    |    -2    |    0    |    0    |
    |    2    |    8    |    14    |    16    |
    |    36    |    46    |    52    |    54    |
Min -> [0,0] = -18
Max -> [3,3] = 54
Suma Filas y Columnas
                                        R
    |    -18    |    -16    |    -8    |    -6    |    -48
    |    -2    |    -2    |    0    |    0    |    -4
    |    2    |    8    |    14    |    16    |    40
    |    36    |    46    |    52    |    54    |    188
R    |    18    |    36    |    58    |    64
}
