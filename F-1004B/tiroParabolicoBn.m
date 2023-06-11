clc
clear all;
close all;


g = 9.8;

Vo = input('Ingrese velocidad inicial: ');
ang = input('Ingrese el angulo que forma el tiro: ');
h = input('Ingrese la altura inicial: ');

ang = ang*pi/180;

t = ((Vo*sin(ang))+((Vo*sin(ang))^2+2*h*g)^0.5)/g;
xmax = Vo*cos(ang)*t;
ymax = h + ((Vo*sin(ang))^2)/(2*g);

t1 =0:0.05:t;
y = h + (Vo*sin(ang)).*t1-(0.5*g).*(t1.^2);

x = Vo*cos(ang).*t1;
y2 = h + (tan(ang).*x)-(0.5*g/(Vo*cos(ang))^2).*(x.^2);

figure(1),plot(t1,y), title('Graficos y vs t'), xlabel('t[segundos]'), ylabel('y[metros]');
figure(2),plot(x,y2,'r*'), title('Graficos y vs X'), xlabel('x[metros]'), ylabel('y[metros]');

for n=1:0.5:xmax
    y3 = h + (tan(ang)*n)-(0.5*g/(Vo*cos(ang))^2)*(n^2);
    hold on;
    figure(3);
    track = plot(n,y3, '*');
    vectores = quiver(n, y3, 0, -0.5);
    axis([0 1.1*xmax 0 1.1*ymax+h]);
    text_ymax = sprintf(' %0.5f m',y3);
    hText = text(xmax/2,ymax/2, text_ymax);
    title('Cañon: y[inicial]'), xlabel('x[metros]'), ylabel('y[metros]');
    if n < xmax-0.5
        delete(hText);
    end
    delete(vectores);
end
