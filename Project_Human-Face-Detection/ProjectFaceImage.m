clc
clear all
close all

%%Detect objects using Viola-Jones Algorithm
%% To detect Face
FDetect = vision.CascadeObjectDetector;
%Read the input image
[file,path]=uigetfile('*.*','Select image');
loc=strcat(path,file);
I=imread(loc);
imshow(I);
pause;

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','y');
end
title('Face Detection');
pause;
%%----------------- 
%% To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',30);
BB=step(NoseDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','y');
end
title('Nose Detection');
pause;
%%----------------- 
%% To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',250);
BB=step(MouthDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','y');
end
title('Mouth Detection');
pause;
%%----------------- 
%% To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
%Read the input Image
BB=step(EyeDetect,I);
figure,imshow(I);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','y');
title('Eyes Detection');
Eyes=imcrop(I,BB);
figure,imshow(Eyes);
pause;
%%----------------- 