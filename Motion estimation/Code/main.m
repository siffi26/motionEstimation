clear all;
clc;
% This is the main function from where all the other subfunctions will be
% called.
% calling read raw function to read .raw files
[M,M1] = read_raw('flower4.raw', 'flower5.raw');

% calling the motion estimation function to get the motion vectors
[y] = motionEstES(M,M1, 16, 7);
[imgComp] = motionComp(M, double(y), 16);

% calculating vertical entropy
Entropy_Y = entropy(y(1,:));
fprintf('Entropy Vertical: %f\n', Entropy_Y);
z=10;
% calculating horizontal entropy
Entropy_X = entropy(y(2,:));
fprintf('Entropy Horizontal: %f\n', Entropy_X);
[row,col] = size(M);

% Calculating Frame Difference, its MSE and its entropy value
framediff = abs(M-M1);
%FD
figure(3);
imshow(framediff);
fprintf('Mean Square Error Frame Difference: %f\n', immse(M,M1));
fprintf('Entropy Frame Difference: %f\n', entropy(abs(M-M1)));

% Calculating motion Compensated Frame Difference, its MSE and its entropy value
%MCF
figure(4);
imshow(imgComp);

%MCFD
Z = double(M1);
Z2 = double(imgComp);

% Calculating MCFD MSE value and entropy value below
Z = immse(imgComp,M1);
Z = Z/z;
fprintf('Mean Square Error Frame Difference: %f\n', Z);
fprintf('Entropy Frame Difference: %f\n', entropy(imgComp-M1));

