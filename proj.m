%% Proyecto LTDS

%% Cargar imagen y dividir en planos

% Cargamos imagen RGB
Img = imread('lena_rgb.png');

% Creamos tres variables cada una con un color R, G y B
ImgR = Img(:,:,1);
ImgG = Img(:,:,2);
ImgB = Img(:,:,3);

% Guardamos tamaño y número planos de colores
[m n p] = size(Img);

%% Transformada directa, inversa y reconstrucción

Imagen = dct(Img);
imwrite(Imagen, 'Imagen.png')

%% Vídeo

%vid = 'Video.avi';
%readerobj = mmreader(vid);
%vidFrames = read(readerobj);
%numFrames = get(readerobj, 'numberOfFrames');
%for k = 1 : numFrames
%    F = getframe;
%    [im, map] = frame2im(F);
%    t = dct(im);
   
%end

%% Vídeo 2

MovObj = VideoReader('Video.avi');
nFrames = MovObj.NumberOfFrames;
%vidHeight = MovObj.Height;
%vidWidth = MovObj.Width;

% Preallocate movie structure.
%mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

% Read one frame at a time.
movie = avifile('Video1.avi');
% movie = read(MovObj, k);
for k = 1 : nFrames
    frame = read(MovObj, k);
    %h = dct (frame);
    l = im2double(frame);
    movie = addframe(movie,frame);
end
movie = close(movie);
%implay('Video2.avi');

%% Video
MovObj = VideoReader('Video.avi');
predic(MovObj, 60);

