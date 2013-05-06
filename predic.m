function [movie] = predic(MovObj, NumPredic)
%UNTITLED Summary of this function goes here
%   Pasamos vídeo en VideoReader y devolvemos movie avi

nFrames = MovObj.NumberOfFrames;
movie = avifile('Video1.avi');

for i = 0 : (floor(nFrames/NumPredic)-1)
    frame = read(MovObj, (i*NumPredic)+1);
    for k = (NumPredic*i)+1 : NumPredic*(i+1)
        framePred = frame - read(MovObj, k);
        %h = dct (framePred);
        movie = addframe(movie,framePred);
    end
end
movie = close(movie);

