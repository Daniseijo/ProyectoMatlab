%% Proyecto LTDS

%% Primero
% Cargamos imagen RGB
Img = imread('lena_rgb.png');

% Creamos tres variables cada una con un color R, G y B
ImgR = Img(:,:,1);
ImgG = Img(:,:,2);
ImgB = Img(:,:,3);

% Guardamos tama�o y n�mero planos de colores
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

%% Predic
frameori = imread('ImgOri.png');
framesig = imread('ImgSig.png');
framepred = im2uint16(frameori) - im2uint16(framesig);
imshow(framepred);
pause;
imwrite(framepred, 'ImgPred.png');
framepredDesp = imread('ImgPred.png');
ultframe = im2uint16(frameori) - im2uint16(framepredDesp);
imshow(framepredDesp);
pause;
imshow(im2uint16(framepredDesp)-framepred);
pause;
imshow(ultframe);
pause;
ultframe = im2uint16(frameori) - (framepred);
imshow(ultframe);

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



%% Eliminar y crear las imagenes para ver los efectos de quitar pixeles en la DCT (Para Barbie)
Img = imread('lena_rgb.png');
for i = -1:7
    [Img1 ImgDCT] = dct(Img, i);
    imwrite(Img1, ['Imagen' num2str(i+1) '.png']);
    imwrite(ImgDCT, ['ImagenDCT' num2str(i+1) '.png']);
end
imshow(Img);

%% Parecido a lo anterior pero con umbral ahora (Para Barbie) NEW

Img = imread('lena_rgb.png');
for i = 0:10
    [Img1 ImgDCT] = dctUmbral(Img, (i*2));
    imwrite(Img1, ['ImagenUmbral' num2str(i) '.png']);
    imwrite(ImgDCT, ['ImagenUmbralDCT' num2str(i) '.png']);
end
imshow(Img);


%% DCT, Implementaci�n
ImgRdct = dct2(ImgR);
imshow(ImgRdct)
ImgGdct = dct2(ImgG);
ImgBdct = dct2(ImgB);