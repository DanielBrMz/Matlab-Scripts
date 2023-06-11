% Parte 2
x = 0:150;

y= -5.*x.^2 - 10.*x + 10;

figure(1);
hold on;
plot(x,y, 'red'); 
title('Gráfica parabólica');
xlabel('Magnitud en X');
ylabel(' Magnitud en Y');