function res = sumaUno(A)
    tam = size(A);
    filas = tam(1,1);
    columnas = tam(1,2);
    B = ones(filas, columnas);
    res = A+B;
end



