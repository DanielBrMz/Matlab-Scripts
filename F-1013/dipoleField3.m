clear;
clc;

%Definición de variables
cargaTotal = 200; %input("Introduce la carga Total: ");

cargaPositiva = (cargaTotal / 100) * 10^-12;
cargaNegativa = -1 * cargaPositiva;
longPositiva = 50; %input("Longitud barra positiva: ");
longNegativa = 30; %input("Longitud barra negativa: ");

numCargas = 100;

cargaPositivaY = linspace(-(longPositiva / 2), longPositiva / 2, numCargas);
cargaNegativaY = linspace(-(longNegativa / 2), longNegativa / 2, numCargas);

distancia = 10; %input("distancia entre las varillas: ");

cargaPositivaX = (0 - (distancia / 2));
cargaNegativaX = (0 + (distancia / 2));

K = 8.99 * 10^9;
r = min(min(distancia, longPositiva), longNegativa) / 7;

dominio = linspace(cargaPositivaX - distancia / 2 , cargaNegativaX + distancia / 2, 30);

if cargaPositivaY(end) > cargaNegativaY(end)
    rango = linspace(cargaPositivaY(1) - distancia / 2, cargaPositivaY(end) + distancia / 2, 30);
else
    rango = linspace(cargaNegativaY(1) - distancia / 2, cargaNegativaY(end) + distancia / 2, 30);
end

[x, y] = meshgrid(dominio, rango);

Ex = x;
Ey = y;

for i = 1:length(x)
    for j = 1:length(y)
        Ex(i, j) = 0;
        Ey(i, j) = 0;
        for n = 1:numCargas
            Ex(i, j) = Ex(i, j) + K * (( cargaPositiva * (x(i, j) - cargaPositivaX) / ((x(i, j) - cargaPositivaX)^2 + (y(i, j) - cargaPositivaY(n))^2 )^(3 / 2) ) + ( cargaNegativa * (x(i, j) - cargaNegativaX) / ((x(i, j) - cargaNegativaX)^2 + (y(i, j) - cargaNegativaY(n))^2 )^(3 / 2) ));
            Ey(i, j) = Ey(i, j) + K * (( cargaPositiva * (y(i, j) - cargaPositivaY(n)) / ((y(i, j) - cargaPositivaY(n))^2 + (x(i, j) - cargaPositivaX)^2 )^(3 / 2) ) + ( cargaNegativa * (y(i, j) - cargaNegativaY(n)) / ((y(i, j) - cargaNegativaY(n))^2 + (x(i, j) - cargaNegativaX)^2 )^(3 / 2) ));
        end
    end
end

E = sqrt(Ex.^2 + Ey.^2);
quiver(x, y, Ex./E, Ey./E);

for n = 1:numCargas
    rectangle("Position", [cargaPositivaX-r/2, cargaPositivaY(n)-r/2, r, r], "Curvature", [1 1], "FaceColor", "#15eb35", "EdgeColor", "#15eb35");
    rectangle("Position", [cargaNegativaX-r/2, cargaNegativaY(n)-r/2, r, r], "Curvature", [1 1], "FaceColor", "#3656ff", "EdgeColor", "#3656ff");
end

axis([dominio(1), dominio(end), rango(1), rango(end)]);
