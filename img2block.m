function [mat] = img2block(img, numQuitar)
%img2block Se proporciona una imagen y se devuelve una matriz
%   Detailed explanation goes here
mat = zeros(512,512);
for i = 0:63
    for j = 0:63
        % cosas de cuadraos
        m = zeros(8,8);
        for k = 1:8
            if (~((8 - numQuitar) <= k))
                for l = 1:8
                    % cosas
                    if (~((8 - numQuitar) <= l))
                        m(k,l) = img((i*8+k),(j*8+l));
                    end
                end
            end
        end
        mat((i*8+1):((i+1)*8),(j*8+1):((j+1)*8)) = m;
    end
end