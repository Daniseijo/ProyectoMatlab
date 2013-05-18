function [ frame ] = readFrames( vid )

readerobj = mmreader(vid);
vidFrames = read(readerobj);
numFrames = get(readerobj, 'numberOfFrames');
for k = 1 : numFrames
mov(k).cdata = vidFrames(:,:,:,k);
mov(k).colormap = [];
%imshow(mov(k).cdata);
imagename=strcat(int2str(k), '.jpeg');
imwrite(mov(k).cdata, strcat('vasanth',imagename));
%extractComponents(mov(k).cdata);

end