a = 4;
v = 5;
x_inicial = 0;
t = 0:.1:10;

x = x_inicial + (v*t) + (a*t.^2)/2;

plot(t,x);
