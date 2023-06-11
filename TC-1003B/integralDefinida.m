


function result = integralDefinida(tramo,desde,hasta)
    f = pi.*((tramo)^2);
    F = int(f,desde,hasta);
    result = F;
end
