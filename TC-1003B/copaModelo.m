%Modelo de Copa de vino
%-Jorge Ivan Carlitos Venezuela A01254785
%-Daniel Alfredo Barreras Meraz A01254805
%-Roberto
%-Daniel Antonio LLLujan

clear;
clc;
syms x;

%Valores inicial y Final en X
desde = 2;
hasta = 11;

%valores de Y en ordenada al origen
tramoA = (-x+5);
%intervaloA = (2<=x) & (x<4);

tramoB = x^0;
%intervaloB = (4<=x)& (x<6); 

tramoC = (real(sqrt(25-((x-11).^2)))+1);
%intervaloC = (6<=x)&(x<11);



%volumenes
primerVol = integralDefinida(tramoA,desde,4);
segundoVol = integralDefinida(tramoB,4,6);
tercerVol = integralDefinida(tramoC,6,hasta);

volumenFinal = primerVol + segundoVol+ tercerVol;
fprintf('El volumnen Final es %.4f',volumenFinal);

%Output
x = 0:2*pi/50:2*pi;
%Error de parseo al usar variables
y = 1.2+cos(x+pi/3.2);
%y = str2double( intervaloA.*tramoA + tramoB.*intervaloB + tramoC.*intervaloC);
 
plot(x,y);
cylinder(y, 100)


