function testReadSequenceImagesAndWriteVideo
%
wvideo = VideoWriter('OutputVideo','MPEG-4'); % '' 
wvideo.FrameRate=30;
open(wvideo)
for framei = 0:504 % 504
	tmp = sprintf('%4.4i.png', framei);
    filename = ['hexbug_vid',tmp];
	im = imread(filename);
    writeVideo(wvideo,im);
    %imshow(im)
end
close(wvideo)