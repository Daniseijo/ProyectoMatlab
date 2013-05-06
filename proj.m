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
%movie = avifile('Video1.avi');
for k = 1 : nFrames
    movie= read(MovObj, k);
    h = dct (movie);
    l = im2double(h);
    movie = addframe(movie,l);
end
movie = close(movie);
implay('Video2.avi');