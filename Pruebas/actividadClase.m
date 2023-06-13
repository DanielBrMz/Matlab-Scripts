clear; clc;

x = linspace(2,12,100);
x1 = randi(6,[1 1000]);

%histogram(x1);

y = x1+randi(6,[1 1000]);

sigma = std(y);
avg = mean(y);

distribucionNormal = (1/(sigma*sqrt(2*pi)))*exp((-(x-avg).^2)/(2*sigma^2));

figure(1);
histogram(y);
hold on;
plot(x, distribucionNormal*1000);

