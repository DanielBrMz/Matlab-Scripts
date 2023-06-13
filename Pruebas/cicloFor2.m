close all;
clear all;
clc
%---------
ti = 0;
tf = 50;
N = 120;
dt = (tf-ti)/N;
g = -9.81; %m/s^2
m = 15;
b = 0.13;
%--------
vi = input('Ingrese velocidad inicial: ');
angulo = input('Ingrese el angulo que forma el tiro: ');
h = input('Ingrese la altura inicial: ');
i = 1:N;
vx(1) = vi*cosd(angulo);
vy(1) = vi*sind(angulo);
xmax = vx(1)*dt*(1-b*dt/m).^i;
xmax = sum(xmax, "all")+vx(1);
%ymin = (vy(1)*(1-b*dt/m).^i+(g*dt).*i)*dt;
%ymin = (sum(ymin, "all")+vy(1)+h)/2;
ymax = h + vy(1);
x(1) = 0;
y(1) = h;

for n = 1:N
    if (vy(1)*(1-b*dt/m)^n+(g*dt)*n)*dt > 0
        ymax = ymax + (vy(1)*(1-b*dt/m)^n+(g*dt)*n)*dt;
    else
        break
    end
end

figure(1);
hold on;
axis([0 xmax+20 0 ymax+ymax*0.08]);
plot(x(1),y(1),'g', 'LineWidth', 5, 'Marker','o')
for n = 0:N
    t(n+1)= ti + n*dt;
    vx(n+2) = vx(n+1)*(1-b*dt/m);
    vy(n+2) = vy(n+1)*(1-b*dt/m)+g*dt; 
    x(n+2) = x(n+1) + vx(n+1)*dt;
    y(n+2) = y(n+1) + vy(n+1)*dt;
   
    x_plot = x(n+2);
    y_plot = y(n+2);
    trayectoria = plot(x_plot, y_plot(:,1), 'g', 'LineWidth', 5, 'Marker','o');
    title('Tiro parabólico');
    xlabel('x[metros]');
    ylabel('y[metros]');
    text_ymax = sprintf('Vy(t) = %0.5f m/s',vy(n+2));
    hText = text(xmax*dt,ymax-10, text_ymax);
    pause(0.09);

    if y_plot >= 0
        delete(trayectoria);
        delete(hText);
    else
         plot(x_plot, 0, 'g', 'LineWidth', 5, 'Marker','o');
         break
    end
end