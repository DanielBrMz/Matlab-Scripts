function main()    
    funcionCuadratica(2, 3, 5);
    areaCirculo(5);
    areaTriangulo(5, 8);
    celsiusFahrenheit();
    calificador([7 8 9 5 4 2 8 7 5 6 4 8 7 6 5 7 10 5 8]);
end

function y = funcionCuadratica(a, b, c)
    vt = -b/(2*a);

    x = vt-5:0.5:vt+5;

    y=a*x.^2+b*x+c;

    plot(x,y), grid on, title("Función cuadrática y= ax^2+bx+c");
end

function result = areaCirculo(radio)
    result = radio^2*pi;
    fprintf("El area de un circulo cuando el radio es %d equivale a: %.3f \n\n", radio, result);
end

function result = areaTriangulo(base, altura)
    result = base*altura/2;
    fprintf("El area de un triangulo de base %d y altura %d equivale a: %.2f \n\n" ...
        ,base, altura, result);
end

function resultado = celsiusFahrenheit()
    a = input("Bienvenido al conversor de grados Celsius y Fahrenheit! \n Selecciona " + ...
        "una opcion \n 1. Celsius a Fahrenheit \n 2. Fahrenheit a Celsius \n");
    grados = input('Ingresa la cantidad a convertir \n');

    if(a == 1)
        resultado = (grados * 9/5) + 32;
        fprintf("%dºC es equivalente a %.1fºF \n\n", grados, resultado);
    elseif(a == 2)
        resultado = (grados - 32)*5/9;
        fprintf("%dºF es equivalente a %.1fºC \n\n", grados, resultado);
    end
end

function [reprobados, aprobados] = calificador(calificaciones)
    reprobados = 0;
    
    for i = 1:size(calificaciones, 2)

        if(calificaciones(i) < 6)
            reprobados = reprobados+1;
        end
    end

    aprobados = size(calificaciones, 2)-reprobados;
    
    fprintf("El número de aprobados es: %d \n", aprobados);
    fprintf("El número de reprobados es: %d \n\n", reprobados)
end

