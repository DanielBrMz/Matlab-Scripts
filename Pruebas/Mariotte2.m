clear; close all; clc;
%-----------------------
%Botella

posBx=0;
posBy=2;

Bbase = 7.62;
Baltura = 16;
botellaX = [posBx, posBx, posBx+Bbase,posBx+Bbase];
botellaY = [posBy + Baltura, posBy,posBy, posBy + Baltura];

grafica = plot(botellaX, botellaY);
set(grafica,"linewidth",3,"color","black")
axis([-1,10,-1,18])

aguaH=12;
baseArea = pi*(Bbase/2)^2;
aguaVol = baseArea*aguaH;

agua = rectangle("position",[posBx,posBy,Bbase,aguaH]);
set(agua,"facecolor","cyan")

%---------------------------
%Valvula
valvulaDiam=1;
valvulaLong=0.2;
posValH=3.5;
valvula = rectangle("position",[posBx+Bbase,posBy+posValH ,valvulaLong,valvulaDiam]);
set(valvula,"facecolor","black");

t = zeros(1,100);
ti=0; t(1)=0;
tf=20;
N=80;
dt=(tf-ti)/N;
n = 0;

while aguaH-0.2 > posValH
        delete(agua)
        t(n+1)=ti+dt;
        v_toricelli = sqrt(2*9.81*aguaH);
        G = v_toricelli*dt*valvulaLong;
        aguaVol =aguaVol-G;
        aguaH = aguaVol/baseArea;
        agua = rectangle("position",[posBx,posBy,Bbase,aguaH]);
        set(agua,"facecolor","#55abdd");
        pause(0.04);
        n = n+1;
end