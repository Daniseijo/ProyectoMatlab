function [Imagen ImagenDCT] = dctUmbral( img, umbral )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

fun = @(block_struct) dct2(block_struct.data);
BR = blockproc(imgR, [8 8], fun);
BR = img2blockUmbral(BR, umbral);
BG = blockproc(imgG, [8 8], fun);
BG = img2blockUmbral(BG, umbral);
BB = blockproc(imgB, [8 8], fun);
[BB] = img2blockUmbral(BB, umbral);

ImagenDCT(:,:,1) = (BR); 
ImagenDCT(:,:,2) = (BG);
ImagenDCT(:,:,3) = (BB);

fun1 = @(block_struct) idct2(block_struct.data);
AR = blockproc(BR, [8 8], fun1);
AG = blockproc(BG, [8 8], fun1);
AB = blockproc(BB, [8 8], fun1);

Imagen(:,:,1) = mat2gray(AR); 
Imagen(:,:,2) = mat2gray(AG);
Imagen(:,:,3) = mat2gray(AB);
end

