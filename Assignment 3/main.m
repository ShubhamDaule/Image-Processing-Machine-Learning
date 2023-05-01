%% Shubham Daule (2787739)
% Assignment 03 
%%
% function main()
clear all
close all
clc
%% Question 1
Game = 'soccer.jpg';
inputIm = imread(Game);

figure
imshow(inputIm) 
title('Original Image')

K = 6;
[clustermap, center, dist] = MYKMEANS(inputIm, K);

figure
imagesc(clustermap)
colormap jet
title('Cluster Map Image With Function MYKMEANS')

disp('----Done for Question 1----')
pause;
%%----------------- 
%% Question 2

Img = reshape(double(inputIm),size(inputIm,1)*size(inputIm,2),3);
idx = kmeans(Img,K);
clustermap2 = reshape(idx,size(inputIm,1),size(inputIm,2));
figure
imagesc(clustermap2)
colormap jet
title('Cluster Map Image by MATLAB Built-in Function')

disp('----Done for Question 2----')
pause;
%%----------------- 
%% Question 3

for i = 2:10
    [clustermap, center, dist(i-1)] = MYKMEANS(inputIm, i);
    fprintf('For given Image, dist is %d when K = %d\n',dist(i-1),i);
end
[M,Ind] = min(dist);
fprintf('For given image, the optimal/minimum dist is obtained when K= %d\n',Ind+1);

disp('----Done for Question 3----')
pause;
%%----------------- 