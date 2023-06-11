%Actividad: Introducción al lenguaje de programación
%Integrantes del equipo:
% Daniel Alfredo Barreras Meraz A01254805
% Rebeca Rodríguez Manjarrez    A01254570

%Problema 1
a = input('Inserte el primer número a sumar ');
b = input('Inserte el segundo número a sumar ');
r = a+b;
fprintf('El resultado de la suma es: %2i \n\n', r);

%Problema 2
b = input('Inserte el lado del cuadrado ');
A = b^2;
fprintf('El Área del cuadrado es: %2i \n\n', A);

%Problema 3
b = input('Inserte la base del triangulo ');
h = input('Inserte la altura del triangulo ');
A = (b*h)/2;
fprintf('El Área del triangulo es: %2i \n\n', A);

%Problema 4
r = input('Inserte el radio del circulo ');
A = pi()*r^2;
fprintf('El Área del circulo es: %2i \n\n', A);

%Problema 5
b = input('Inserte el radio de la base del cono ');
h = input('Inserte la altura del cono ');
V = (pi()*r^2*h)/3;
fprintf('El Volumen del cono es: %2i \n\n', V);

%Problema 6
a = input('Inserte la primera venta ');
b = input('Inserte la segunda venta ');
c = input('Inserte la tercera venta ');
comTotal = (a+b+c)*0.1;
fprintf('La comision total del vendedor es de: %2i pesos\n\n', comTotal);

%Problema 7
a = input('Inserte el precio del primer articulo ');
b = input('Inserte el precio del segundo articulo ');
c = input('Inserte el precio del tercer articulo ');
d = input('Inserte el precio del cuerto articulo ');
pagoTotal = (a+b+c+d)-(a+b+c+d)*0.15;
fprintf('El precio total con descuento aplicado es de: %2i pesos\n\n', pagoTotal);

%Problema 8
p = input('Inserte la cantidad en pesos ');
d = p/22.04;
fprintf('%2i pesos equivalen a: %2i dolares\n\n', p, d);

%Problema 9
F = input('Ingrese una temperatura en grados Fahrenheit ');
C =(5/9)*(F-32);
fprintf('%2iº Fahrenheit equivalen a: %2iº Celsius\n\n', F, C);

%Problema 10
GB = input('Inserte la cantidad de Gigabytes a convertir ');
MB = GB*1024;
KB = GB*1024^2;
B = GB*1024^3;
fprintf('%2i Gigabytes equivalen a: \n%2i Megabytes\n', GB, MB);
fprintf('%2i Kilobytes\n %2i Bytes \n\n', KB, B);

