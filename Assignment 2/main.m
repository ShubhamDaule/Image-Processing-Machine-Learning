% function main()
clear all
close all
clc
newMin = 0;
newMax = 255;
%% Question 1
Im = imread('Food.jpg');

scaledfood = Mapping(Im, [newMin, newMax]);

figure;
subplot(1,2,1);imshow(Im);title('Original Image');
subplot(1,2,2);imshow(scaledfood);title('Scaled Image');

disp('----Done for Question 1----')
pause;
%%----------------- 
%% Question 2
im=imread('Circuit.jpg');

filteredIm = im;

N=3;
n=N*N;
mask_val= (diff([0,sort(randi([0,100-n],1,n-1)),100-n])+ones(1,n))/100;
mask=reshape(mask_val,[N N]);

R3filteredIm= AverageFiltering(filteredIm,mask); 

N=5;
n=N*N;
mask_val= (diff([0,sort(randi([0,100-n],1,n-1)),100-n])+ones(1,n))/100;
mask=reshape(mask_val,[N N]);

R5filteredIm= AverageFiltering(filteredIm,mask); 

figure;
subplot(1,3,1);imshow(im);title('Original Image');
subplot(1,3,2);imshow(R3filteredIm);title('3*3 Averaging Mask');
subplot(1,3,3);imshow(R5filteredIm); title('5*5 Averaging Mask');

disp('----Done for Question 2----')
pause;
%%----------------- 
%% Question 3

mask1 = ones(3);
filteredim1 = MedianFiltering(im, mask1);

mask2 = ones(5);
filteredim2 = MedianFiltering(im, mask2);

figure,
subplot(1,3,1);imshow(im);title('Original Image');
subplot(1,3,2);imshow(filteredim1),title('3x3 Median Filterd Mask');
subplot(1,3,3);imshow(filteredim2);title('5x5 Median Filterd Mask');

disp('----Done for Question 3----');
pause;
%%----------------- 
%% Question 4
moon=imread('Moon.jpg');
alpha = 0.3;
lapl = fspecial('laplacian',alpha);
filteredmoon = imfilter(moon,lapl);

scaledfilteredmoon = Mapping(moon, [newMin, newMax]);

enhancedmoon= moon - filteredmoon;

figure; 
subplot(2,2,1);imshow(moon); title('Original Image');
subplot(2,2,2);imshow(filteredmoon); title('Laplacian Filtered Image');
subplot(2,2,3);imshow(scaledfilteredmoon); title('Scaled Filtered Image');
subplot(2,2,4);imshow(enhancedmoon); title('Enhanced Image');
 
disp('----Done for Question 4----')
pause;
%%----------------- 