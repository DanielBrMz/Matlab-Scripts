clear;
clc;
close all;

% Parámetros de la góndola
masa = 500; % Masa de la góndola (kg)
areaFrontal = 2; % Área frontal de la góndola (m^2)
coefArrastre = 1.5; % Coeficiente de arrastre de la góndola
conductividad = 3.5e7; % Conductividad eléctrica del aluminio (S/m)

% Parámetros físicos
g = 9.81; % Aceleración debida a la gravedad (m/s^2)
rhoAire = 1.225; % Densidad del aire (kg/m^3)

% Parámetros de los frenos
B0 = 0.5; % Intensidad máxima del campo magnético generado por los frenos (T)
L = 2; % Longitud de los frenos (m)

% Condiciones iniciales
z0 = 50; % Posición inicial de la góndola (m)
v0 = 0; % Velocidad inicial de la góndola (m/s)
tspan = [0 10]; % Intervalo de tiempo a simular (s)
h = 0.01; % Paso de tiempo (s)

% Cálculo de la trayectoria de la góndola
[t,z,v] = trayectoriaGondola(masa, areaFrontal, coefArrastre, conductividad, g, rhoAire, B0, L, z0, v0, tspan, h);

% Gráficas de los resultados
graficarPosicion(t,z);
graficarVelocidad(t,v);

% Función que calcula la trayectoria de la góndola
function [t,z,v] = trayectoriaGondola(masa, areaFrontal, coefArrastre, conductividad, g, rhoAire, B0, L, z0, v0, tspan, h)
    % Inicialización de variables
    t = tspan(1):h:tspan(2);
    z = zeros(1,length(t));
    v = zeros(1,length(t));
    z(1) = z0;
    v(1) = v0;
    
    % Bucle para calcular la trayectoria de la góndola
    for i = 1:length(t)-1
        Fd = 0.5 * rhoAire * areaFrontal * coefArrastre * v(i)^2;
        Fb = fuerzaFrenado(conductividad,B0,L,v(i));
        Fg = masa * g;
        F = Fg - Fd - Fb;
        a = F / masa;
        z(i+1) = z(i) + v(i) * h + 0.5 * a * h^2;
        v(i+1) = (z(i+1) - z(i)) / h;
    end
end

% Función que calcula la fuerza de frenado magnético
function Fb = fuerzaFrenado(conductividad,B0,L,v)
    Fb = conductividad * B0^2 * L^2 * v;
end

% Función que grafica la posición de la góndola en función del tiempo
function graficarPosicion(t,z)
    figure;
    plot(t,z,'-b','LineWidth',2);
    grid on;
    xlabel('Tiempo (s)');
    ylabel('Altura (m)');
    title('Altura de la góndola en función del tiempo');
end

% Función que grafica la velocidad de la góndola en función del tiempo
function graficarVelocidad(t,v)
    figure;
    plot(t,v,'-r','LineWidth',2);
    grid on;
    xlabel('Tiempo (s)');
    ylabel('Velocidad (m/s)');
    title('Velocidad de la góndola en función del tiempo');
end
