a = -9.8;
x_inicial = 0;
y_inicial = 0;
t = 0:.01:1;
vx = 3*cosd(32);
vy = 3*sind(32);


x = vx*t;
y = (vy*t) + (a*t.^2)/2;
plot(x, y);

figure(1);
hold on;


for n=1:length(t)
    tiempo = t(n);
    x = vx*tiempo;
    y = (vy*tiempo) + (a*tiempo.^2)/2;
    vec = quiver(x, y, 0, -.5);
    plot(x, y);
    xlim([0 inf]);
    pause(0.1);
    %delete(vec);
end



