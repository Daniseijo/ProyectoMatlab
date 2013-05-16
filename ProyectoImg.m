%% Proyecto LTDS

%% Primero
% Cargamos imagen RGB
Img = imread('lena_rgb.png');

% Creamos tres variables cada una con un color R, G y B
ImgR = Img(:,:,1);
ImgG = Img(:,:,2);
ImgB = Img(:,:,3);

% Guardamos tamaño y número planos de colores
[m n p] = size(Img);

% Mostramos las cuatro imagenes
imshow(Img);
pause
imshow(ImgR);
pause
imshow(ImgG);
pause
imshow(ImgB);
pause

% Perfil de imagen (trazamos una lÃ­nea con clic al principio y clic al
% final y pulsamos enter)
imshow(Img)
improfile

%% Submuestreo de la imagen
% Definimos factor de muestreo
a = 2;
% Submuestreamos
Img_sub = Img(1:a:end, 1:a:end, 1:1:end);
imshow(Img_sub);

%% Aclarar, oscurecer
% Debemos pasar a double para operar con decimales bien
Img_double = double(Img);
Img_osc = Img_double*0.25;
Img_osc = uint8(Img_osc);
imshow(Img_osc);
pause
Img_clara = Img_double/0.25;
Img_clara = uint8(Img_clara);
imshow(Img_clara);
pause

%% BinarizaciÃ³n
% ConversiÃ³n a dos valores

Img_bin = im2bw(Img,0.5);
imshow(Img_bin);



%% Eliminar y crear las imagenes para ver los efectos de quitar pixeles en la DCT (Para Barbie)
Img = imread('lena_rgb.png');
for i = -1:7
    [Img1 ImgDCT] = dct(Img, i);
    imwrite(Img1, ['Imagen' num2str(i+1) '.png']);
    imwrite(ImgDCT, ['Imagen' num2str(i+1) 'DCT.png']);
end
imshow(Img);



%% DCT, Implementación
ImgRdct = dct2(ImgR);
imshow(ImgRdct)
ImgGdct = dct2(ImgG);
ImgBdct = dct2(ImgB);