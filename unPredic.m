function [movie] = unPredic(MovObj, NumPredic)
%UNTITLED Summary of this function goes here
%   Pasamos vídeo en VideoReader y devolvemos movie avi

nFrames = MovObj.NumberOfFrames;
movie = avifile('Video2.avi');

for i = 0 : (floor(nFrames/NumPredic)-1)
    frame = im2double(read(MovObj, (i*NumPredic)+1));
    movie = addframe(movie, frame);
    for k = (NumPredic*i)+1 : (NumPredic*(i+1))-1
        framePred = read(MovObj, k+1);
        frameUlt = frame - im2double(framePred);
        movie = addframe(movie,frameUlt);
    end
end
movie = close(movie);
