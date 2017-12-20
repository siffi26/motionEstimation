function [M, M1]=read_raw(filename1, filename2)
%Storing size of image 
if filename1(1)=='c'
    row =352; col=288;
    row1 = 352; col1=288;
else
    row = 720; col=480; 
    row1 = 720; col1=480;
end
%Reading the two files inputted in raw format in a 2D matrix
%For First File
if true  
X = fopen(filename1, 'r');
I = fread(X, row*col, 'uint8=>uint8');
Z = reshape(I, row, col);
Z = Z';
figure(1);
subplot(211);
imshow(Z);
title(filename1);
M = Z;
end

%For Second File
if true
X1 = fopen(filename2, 'r');
I1 = fread(X1, row1*col1, 'uint8=>uint8');
Z1 = reshape(I1, row1, col1);
Z1 = Z1';
figure(1);
subplot(212);
imshow(Z1);
title(filename2);
M1 = Z1;
end
end

