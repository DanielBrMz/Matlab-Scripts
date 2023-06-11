%PARTE 1 

num = input('Ingresa un número de 3 digitos y te diré si es capicúa \n');

dig1 = floor(num/100);
digf = mod(num, floor(num/10));

if num >= 1000 || num < 100
    disp('El número es invalido')
elseif  dig1 == digf 
    disp('El número es capicúa');
else
    disp('El número no es capicúa')
end