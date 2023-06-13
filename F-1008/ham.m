clear; close all; clc;

%Slider
hslider = uicontrol (                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'position', [0.1, 0.1, 0.8, 0.1], ...
         'min', 1,                         ...
         'max', 24,                        ...
         'value', 1,                      ...
         'callback', {@sliderCallbackCisterna} ...
       );
function time = sliderCallbackCisterna(h, ~)
    time = get (h, 'value');
    disp(time);
    %-----------------------
    %Botella
    
    posBx=0;
    posBy=3;
    
    Bbase = 7.62;
    Baltura = 16;
    botellaX = [posBx, posBx, posBx+Bbase,posBx+Bbase];
    botellaY = [posBy + Baltura, posBy,posBy, posBy + Baltura];
    
    labelString = "El tiempo/frame es: " + time;
    xlabel(labelString);
    grafica = plot(botellaX, botellaY);
    set(grafica,"linewidth",3,"color","black")
    axis([-2,14,-1,21])
    
    aguaH=12;
    baseArea = pi*(Bbase/2)^2;
    aguaVol = baseArea*aguaH;
    
    agua = rectangle("position",[posBx,posBy,Bbase,aguaH]);
    set(agua,"facecolor","cyan")
    
    %---------------------------
    %Valvula
    valvulaDiam=1;
    valvulaLong=0.5;
    posValH=3.5;
    valvula = rectangle("position",[posBx+Bbase,posBy+posValH ,valvulaLong,valvulaDiam]);
    set(valvula,"facecolor","black");
    
    t = zeros(1,100);
    ti=0; t(1)=0;
    tf=20;
    N=80;
    dt=(tf-ti)/N;
    n = 0;
    
    while aguaH-0.2 > posValH
            delete(agua)
            t(n+1)=ti+dt;
            v_toricelli = sqrt(2*9.81*aguaH);
            G = v_toricelli*dt*valvulaLong;
            aguaVol =aguaVol-G;
            aguaH = aguaVol/baseArea;
            agua = rectangle("position",[posBx,posBy,Bbase,aguaH]);
            set(agua,"facecolor","#55abdd");
            pause(0.04);
            n = n+1;
    end

    t = linspace(0,24,100);
    A = 1.483*10^(-4);
    B = -7.627^(-2);
    C = 1.3918^(-1);
    y = A*t.^2 + B*t+C;

    plot(t,y);

end

