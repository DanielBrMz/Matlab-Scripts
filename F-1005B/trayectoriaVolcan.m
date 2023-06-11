close all;
clear all;
clc;
%---------
ti = 0;
tf = 30;
N = 60;
dt = (tf-ti)/N;
g = -9.81; %m/s^2
m = 15;
b = 0.13;
%--------
vi = [20 40 60];
angulo = [30 45 60];
h = 45;
i=1:3;
vx(i,1) = vi(i).*cosd(angulo);
vy(i,1) = vi(i).*sind(angulo);
x(i,1) = 0;
y(i,1) = h;

figure(1);
hold on;
axis([0 400 0 250]);
plot(x(1),y(1),'g', 'LineWidth', 5, 'Marker','o')

for n = 0:N 
    for j = i
        t(j, n+1)= ti + n*dt;
        vx(j, n+2) = vx(j,n+1)*(1-b*dt/m);
        vy(j, n+2) = vy(j,n+1)*(1-b*dt/m)+g*dt; 
        x(j, n+2) = x(j,n+1) + vx(j,n+1)*dt;
        y(j, n+2) = y(j,n+1) + vy(j,n+1)*dt;
        
        obsize = 10;
        objeto(i) = rectangle('Position', [x(j, n+1)-obsize/2, y(j,n+1)-obsize/2, obsize, obsize], 'curvature', [1,1]);
    end
    for j = 1:3
        x_plot = x(j,n+2);
        y_plot = y(j, n+2);

        trayectoria = plot(x_plot, y_plot, 'g', 'LineWidth', 5, 'Marker','o');
        title('Tiro parabólico');
        xlabel('x[metros]');
        ylabel('y[metros]');
    end
    pause(0.05);

    for j=1:3
        object = objeto(j);
        delete(object);
    end
end