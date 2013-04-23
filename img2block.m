function [mat] = img2block(img)
%UNTITLED Se proporciona una imagen y se devuelve una matriz
%   Detailed explanation goes here
mat = zeros(512,512);
for i = 0:63
    for j = 0:63
        % cosas de cuadraos
        m = zeros(8,8);
        for k = 1:8
            for l = 1:8
                % cosas
                m(k,l) = img((i*8+k),(j*8+l));
                m(k,l) = m(k,l) - 128;
            end
        end
        m = dct2(m);
        mat((i*8+1):((i+1)*8),(j*8+1):((j+1)*8)) = m;
    end
end