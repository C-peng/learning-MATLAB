% I=imread('C:\Users\cpeng\Desktop\00000001.jpg','jpg');
% axes(handles.axes1);
% image(I)
% axis off;
% mp= handles.activex1; % activex1 Ϊ���õ�WMP��handle��
% 
% %��ͼ��
% h=imrect;%�����ʮ�֣�����ѡȡ����Ȥ����
% 
% %ͼ�оͻ���ֿ����϶��Լ��ı��С�ľ��ο�ѡ��λ�ú�
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
