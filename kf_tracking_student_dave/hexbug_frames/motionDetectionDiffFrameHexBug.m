% Mon hoc He thong thi giac trong ky thuat
function motionDetectionDiffFrameHexBug()
%
clc, clear, close all;
%
video = VideoReader('OutputVideo.mp4');
%
wvideo = VideoWriter('OutputVideoImdiff','MPEG-4'); % '' 
wvideo.FrameRate=20;
open(wvideo)
%
nf = 0;
height = video.Height;
width = video.Width;
imold = uint8(zeros(height,width));
imdiff1 = uint8(zeros(height,width));
SE = strel('square',3);
while hasFrame(video)
    im = readFrame(video);
    im1 = uint8(rgb2gray(im));
    nf = nf+1;
    imdiff = uint8(ones(height,width)*0);
    if nf>1
        imdiff1 = im1-imold;
        for i=1:height
            for j=1:width
                if(imdiff1(i,j)>5)
                    imdiff(i,j)=255;
                end
            end
        end
        imold = im1;
    end
    imdiff = imopen(imdiff,SE);
    %imdiff = imdilate(imdiff,SE);
    %imdiff = imclose(imdiff,SE);
    %imdiff = imerode(imdiff,SE);
    writeVideo(wvideo,imdiff);
    %imshow(imdiff);
end
close(wvideo)