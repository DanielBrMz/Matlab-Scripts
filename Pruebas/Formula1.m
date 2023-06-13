% Puntos inicial y final de la funcion
init = 100;
final = 2800;
dt = 500;

% Declaracion de la función de ajuste
x = linspace(init,final,dt);
y = (-0.0000009755*x.^3+0.0042119015*x.^2-4.4692011235*x+3317.2051299307);

% Inicialización de la pista
figure(1);
hold on;
grid on;
axis([min(x)-50 max(x)+50 min(y)-500 max(y)+500]);
plot(x,y,'Color',[0.18 0.176 0.176],'LineWidth',12);
plot(x,y,'--','Color',[0.96 0.823 0.121],'LineWidth',1.5);
animation = plot(x(500),y(500),'ks','MarkerFaceColor',[0.372 0.8 0.65],'MarkerSize',10);

% Ubicacion de las gradas usando puntos máximos
gradas1 = rectangle('Position', [701 min(y)-150*2 80 5], 'EdgeColor', 'b', 'FaceColor', 'r', 'LineWidth', 20);
gradas2 = rectangle('Position', [2167 max(y)+150*2 80 5], 'EdgeColor', 'b', 'FaceColor', 'r', 'LineWidth', 20);

% Uso de la derivada para calcular el radios
m = diff(y);
e1 = 230;

%Modelacion del movimiento
for j=0:2
    for i=2:dt
        set(animation,'XData',x(i));
        set(animation,'YData',y(i));

        angle = atan(m(i-1));   
        q1 = quiver(x(i), y(i), e1*cos(angle)+20, e1*sin(angle)+20, 0, 'b-');
        t1 = text(x(i) + (e1*cos(angle)), y(i)+(e1*sin(angle)), 'Ft');

        if i>dt/2
            q2 = quiver(x(i), y(i), e1*cos(angle+pi/2), e1*sin(angle+pi/2), 0, 'g-');
            t2 = text(x(i) + (e1*cos(angle+pi/2)), (y(i)+(e1*sin(angle+pi/2))), 'Fn');
        else 
            q2 = quiver(x(i), y(i), e1*cos(angle-pi/2), e1*sin(angle-pi/2), 0, 'g-');
            t2 = text(x(i) + (e1*cos(angle-pi/2)), (y(i)+(e1*sin(angle-pi/2))), 'Fn');
        end

        pause(0.0001);
        delete(q1);
        delete(t1);
        delete(q2);
        delete(t2);

    end
end
