Q2InputImg = imread('soccer.jpg');
A = imresize(Q2InputImg,0.5);
L = imsegkmeans(A,6);
B = labeloverlay(A,L);
figure(2);
imshow(B)