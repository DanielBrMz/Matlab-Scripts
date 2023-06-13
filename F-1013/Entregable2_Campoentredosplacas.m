%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Campo eléctrico entre dos placas paralelas        %
% Profra. Jocelyn Castro 24/04/2023                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;close all;clc;
l=10;
N=20;
minX=-15; maxX=15;
minY=-5-l/2; maxY=5+l/2;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);

[xG,yG]=meshgrid(x,y);

%Posicion del centro de la placa negativa
xCn=-5;    yCn=0; 

%Posicion del centro de la placa positiva
xCp=5;    yCp=0;

%campo electrico de acuerdo a la fórmula y ley de coulomb
Qn=-l; %Densidad de carga negativa
Qp= l; %Densidad de carga positiva
eps0 = 8.854e-12;
kC = 1/(4*pi*eps0);

%%%Generar Campo Eléctrico
Ex=0;
Ey=0;
for(i=-l/2:1:l/2)
%Campo placa negativa
Rx = xG - xCn;
Ry = yG - i*l/N;
R = sqrt(Rx.^2 + Ry.^2).^3;
Ex = Ex+kC .* Qn .* Rx ./ R;
Ey = Ey+kC .* Qn .* Ry ./ R;
%Campo placa positiva
Rx = xG - xCp;
Ry = yG - i*l/N;
R = sqrt(Rx.^2 + Ry.^2).^3;
Ex = Ex + kC .* Qp .* Rx ./ R;
Ey = Ey + kC .* Qp .* Ry ./ R;
E = sqrt(Ex.^2 + Ey.^2);
end;

%Componentes x,y
u=Ex./E;
v=Ey./E;

figure();
h=quiver(xG,yG,u,v, 'autoscalefactor',0.6);
set(h,'color',[1 0 1], 'linewidth',1.5);
axis([-7 7 -l/2-5 l/2+5]);
axis equal;
box on;
h=rectangle('Position',[-6, -l/2,2,l]); % Placa negativa
set(h,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
text(-5.5, 0,'-','Color','white','FontSize',30);
h=rectangle('Position',[4, -l/2,2,l]); % Placa positiva
set(h,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
text(4.3, 0,'+','Color','white','FontSize',30);





























