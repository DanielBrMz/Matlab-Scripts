x = linspace(0,2*pi,60);

y1 = sin(2*x);

y2 = 2*cos(2*x);

subplot(2,1,1)
plot(x,y1, '--mo');
title('Grafica de sen(x)')

legend('sen(2x)', 'Location', 'northeast');

subplot(2,1,2);
plot(x,y2, ':bs')
title('Grafica de 2cos(2x)')
legend('2cos(2x)', 'Location', 'south')