function [movie] = predic(MovObj, NumPredic)
%UNTITLED Summary of this function goes here
%   Pasamos v�deo en VideoReader y devolvemos movie avi

nFrames = MovObj.NumberOfFrames;
movie = avifile('Video1.avi');

for i = 0 : (floor(nFrames/NumPredic)-1)
    frame = im2double(read(MovObj, (i*NumPredic)+1));
    movie = addframe(movie, frame);
    for k = (NumPredic*i)+1 : (NumPredic*(i+1))-1
        framePred = frame - im2double(read(MovObj, k+1));
        movie = addframe(movie,framePred);
    end
end
movie = close(movie);

