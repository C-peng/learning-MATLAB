% I=imread('C:\Users\cpeng\Desktop\00000001.jpg','jpg');
% axes(handles.axes1);
% image(I)
% axis off;
% mp= handles.activex1; % activex1 为调用的WMP的handle。
% 
% %画图后：
% h=imrect;%鼠标变成十字，用来选取感兴趣区域
% 
% %图中就会出现可以拖动以及改变大小的矩形框，选好位置后：
% 
% pos=getPosition(h);

% trainImgStr = 'trainImg';  
% trainImgDir = dir([trainImgStr,'\*']);  
% structGT = {};  
% for i = 1:length(trainImgDir)  
%     if(strcmp(trainImgDir(i).name,'.') || strcmp(trainImgDir(i).name,'..'))  
%         continue;  
%     else  
%         im = imread([trainImgStr,'\',trainImgDir(i).name]);  
%         h1 = imshow(im);  
%         h2 = imrect(gca);  
%         position = wait(h2);  
%         position = round(position);  
%         GT.boxes = position;  
%         GT.img = trainImgDir(i).name;  
%         close();  
%         structGT = [structGT,GT];  
%     end  
% end  
% save('structGT','structGT');
clc
clear
close all;
figure, imshow('2.jpg');
h = imrect;
position = wait(h);
%  pos=getPosition(h)
