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

% Perfil de imagen (trazamos una línea con clic al principio y clic al
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

%% Binarización
% Conversión a dos valores

Img_bin = im2bw(Img,0.5);
imshow(Img_bin);

%% Pruebas raras para dividir la imagen en bloques de 8x8

Img1 = img2block(ImgR);
imshow(Img1);

%% DCT, Implementación
ImgRdct = dct2(ImgR);
imshow(ImgRdct)
ImgGdct = dct2(ImgG);
ImgBdct = dct2(ImgB);