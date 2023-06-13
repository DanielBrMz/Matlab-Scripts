clear all; close all; clc;

posBx=0;
posBy=0;
g = 9.8;

Baltura = 10;
Bbase = 5;
botellaX = [posBx, posBx, posBx+Bbase, posBx+Bbase];
botellaY = [posBy + Baltura, posBy, posBy, posBy + Baltura];

grafica = plot(botellaX, botellaY);
set(grafica, "linewidth", 3, "color", "black");
axis([-1,12,-1,11]);

valvulaDiam = 1;
valvulaLong = 1;
valvulaArea = pi*(valvulaDiam/2)^2;
posValH = 2.2;
valvula = rectangle("Position", [posBx+Bbase, posBy+posValH, valvulaLong, valvulaDiam]);

aguaH=8;
baseArea= pi*(Bbase/2)^2;
aguaVol = baseArea*aguaH;
t = 0:30;
velocidad = sqrt(2*g*posValH);
gasto = valvulaArea*velocidad;

for i=t
    agua = rectangle("Position", [posBx, posBy, Bbase, aguaH-gasto*i]);
    set(agua, "facecolor", "#66bbfa");
    pause(0.2);
    delete(agua);
end
