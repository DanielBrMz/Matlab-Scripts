a = 10;
while a < 20
    fprintf('Valor de a: %d\n', a);
    a = a + 1;
end

for a = 10:20
    fprintf('Valor de a: %d\n', a);
end

for a = 1.0:5:100.0
    fprintf('Valor de a: %d\n', a);
end

for a = [24,18,17,23,28]
    fprintf('Valor de a: %d\n', a);
end


x = 0:0.01:10;
y = x.^2-10.*x+15;
plot(x,y);