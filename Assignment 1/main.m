 % function main()
clear all
close all
clc
%% Question 1
A=imread('peppers.bmp');
imshow(A)
title('Original RGB color Image.bmp');
disp('----Done for Question 1----')
pause;
%%----------------- 
%% Question 2
B=rgb2gray(A);
TB=B'; 
VB=flipud(B);
HB=fliplr(B);
Mean=mean2(B); %Mean of B 
Min=min(min(B)); %Minimum of B
Max=max(max(B)); %Maximum of B
Median=median(median(B)); %Median of B
figure,
subplot(2,2,1);imshow(B),title('Grayscale Image'); %Upper Left
subplot(2,2,2);imshow(TB),title('Transpose Image'); %Upper Right
subplot(2,2,3);imshow(VB),title('Vertically Flip Image'); %Lower Left
subplot(2,2,4);imshow(HB),title('Horizontally Flip Image'); %Lower Right
disp('----Done for Question 2----');
pause;
%%-----------------
%% Question 3
C=im2double(B);
figure,imshow(C,[0,1]),title('Normalized Grayscale Image');
imwrite(C,'blur.png');
disp('----Done for Question 3----');
pause;
%%-----------------
%% Question 4
Thresh=0.4;
bw1=C>Thresh;
figure,
subplot(1,2,1);imshow(bw1),title('My Method bw1');
bw2=im2bw(C, Thresh);
subplot(1,2,2);imshow(bw2),title('Matlab Method bw2');
if isequal(bw1,bw2)
    disp('bw1 and bw2 are the same');
else
    disp('bw1 and bw2 are not same');
end
disp('----Done for Question 4----');
pause;
%%-----------------
%% Question 5
A2 = MyBlur(A);
B2 = MyBlur(B); 
figure,
subplot(2,2,1);imshow(A),title('Original A image ...');
subplot(2,2,2);imshow(B,[]),title('Original B image ...');
subplot(2,2,3);imshow(A2,[]),title('Blurred A image ...');
subplot(2,2,4);imshow(B2,[]),title('Blurred B image ...');
disp('-----Done for Question 5-----');
pause;
%%-----------------

