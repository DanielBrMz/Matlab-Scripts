function examenArchivo1()
    funcionCuadratica(1,-10,15);
end

function y = funcionCuadratica(a, b ,c)
    x = 0:2*pi:100;
    y = a*x.^2+b*x+c;

    titulo = sprintf("Gráfica función: %dx^2%dx+%d",a,b,c);
    plot(x, y, 'g', 'LineWidth', 3, 'Marker','diamond');
    title(titulo), xlabel('Eje x'), ylabel('Eje y');
    grid on;

end