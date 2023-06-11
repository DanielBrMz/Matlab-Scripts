age = input('Ingrese su edad: ');

if age <16 && age>0
    disp('Lo siento. Tendrá que esperar');
elseif age >= 16 && age < 18
    disp('Puede obtener un permiso provisional para conducir');
elseif age >= 18 && age < 70
    disp('Puede obtener una licencia estándar');
else
    disp('Los mayores de 70 requeren una licencia especial');
end

 