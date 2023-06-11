function examenArchivo2()
    funcionCuadratica(1,130,sind(-20));
end

function y = funcionCuadratica(a, b ,c)
    x = 0:2*pi:100;
    y = a*x.^2+b*x+c;

    titulo = sprintf("Gráfica función: %dx^2+%dx+%d",a,b,c);
    plot(x, y, 'cyan', 'LineWidth', 5, 'Marker','v');
    title(titulo), xlabel('Eje x'), ylabel('Eje y');
    grid on;
    
end