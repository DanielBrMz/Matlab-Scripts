x=0:pi/100:2*pi;

y1=sin(2*x);

y2 = 2*cos(2*x);

plot(x, y1, x, y2);

title('Grafica de sen(2x) y su derivada 2cos(2x)');
xlabel('Eje x');
ylabel('Eje y');