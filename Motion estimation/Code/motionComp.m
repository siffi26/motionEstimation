% Computes motion compensated image using the given motion vectors
% imgI : The reference image 
% motionVect : The motion vectors
% mbSize : Size of the macroblock
% imgComp : The motion compensated image

function imgComp = motionComp(imgI, motionVect, mbSize)

[row col] = size(imgI);

% we start off from the top left of the image
% we will walk in steps of mbSize
% for every block that we look at we will read the motion vector
% and put that block from refernce image in the compensated image

mbCount = 1;
for i = 1:mbSize:row-mbSize+1
    for j = 1:mbSize:col-mbSize+1
        
        % dy is row(vertical) index
        % dx is col(horizontal) index        
        dy = motionVect(1,mbCount);
        dx = motionVect(2,mbCount);
        refBlkVer = i + dy;
        refBlkHor = j + dx;
        imageComp(i:i+mbSize-1,j:j+mbSize-1) = imgI(refBlkVer:refBlkVer+mbSize-1, refBlkHor:refBlkHor+mbSize-1);    
        mbCount = mbCount + 1;
    end
end

imgComp = imageComp;
end