clear all
close all
clc

ti = 0; % Tiempo inicial
tf = 1; % Tiempo final
N = 15; % Número de pasos
dt = (tf-ti)/N;

xi = 0;
yi = 0;
vxi = 5;
vyi = 5;
a = -9.81;

figure(1)
hold on
axis([0 5 0 1.5]);

for n=0:N  
    t(n+1)= ti + n*dt;
    x = xi + vxi*t(n+1);
    y = yi + vyi*t(n+1) + 0.5*a*t(n+1)^2;
    plot(x, y, '.');
    pause(.1)
end
t