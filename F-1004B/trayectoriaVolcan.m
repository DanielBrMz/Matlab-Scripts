close all;
clear all;
clc;
rng default;
%FORMULAS PARA TRAYECTORIA SIN FRICCIÓN

%FORMULAS PARA TRAYECTORIA CON FRICCIÓN
vi = [randi(20) randi(20)+20 randi(20)+40];
ang = [30 45 60];
h = 45;
i=1:3;
%---------
ti = 0;
tf = 12;
N = 60;
dt = (tf-ti)/N;
g = -9.81; %m/s^2
m = 15;
b = 0.13;
contador = 1;
color = ["g" "r" "m"];
%--------
vx(i,1) = vi(i).*cosd(ang);
vy(i,1) = vi(i).*sind(ang);
x(i,1) = 0;
y(i,1) = h;

figure(1);
hold on;
axis([0 200 0 150]);
plot(x(1),y(1),'black', 'LineWidth', 5, 'Marker','o')

for n = 0:N 
    if contador == 4
        break
    end
    for j = i
        vx(j, n+2) = vx(j,n+1)*(1-b*dt/m);
        vy(j, n+2) = vy(j,n+1)*(1-b*dt/m)+g*dt; 
        x(j, n+2) = x(j,n+1) + vx(j,n+1)*dt;
        y(j, n+2) = y(j,n+1) + vy(j,n+1)*dt;
        
        %objeto(i) = rectangle('Position', [x(j,n+2), y(j,n+2), 1, 1], 'curvature', [1,1]);
    end
    for j = i
        x_plot = x(j,n+2);
        y_plot = y(j, n+2);
        trayectoria(j) = plot(x_plot, y_plot, color(j), 'LineWidth', 5, 'Marker','o');
        title('Tiro parabólico');
        xlabel('x[metros]');
        ylabel('y[metros]');    
    end
    pause(0.016);

    for j=1:3
      %object = objeto(j);
      %delete(object);
      delete(trayectoria(j));
    end
    if y(contador, n+2) <= 0
        plot(x(contador,n+1), 0, color(contador), 'LineWidth', 5, 'Marker','o');
        contador = contador +1;
        i = contador:3;
    end
end