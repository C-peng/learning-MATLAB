% function [ ] = photoresize( readdir )  
% % 图像批量改大小函数  
% % 输入参数：readdir  需要改大小的图像所在目录(要求只有图像文件，格式无所谓)  
%   
% % 写入图像格式  
% writetype = 'jpg';  
% % 写入图像目录，直接附加在读取目录后加上"png resize"  
% writedir = [readdir,' resize ',writetype];  
% % 大小改变因子，有两种表示方法，比例或者尺寸  
% resizefactor = 0.2451;  
% % resizefactor = [800 600];  
% % 创建改大小之后图像目录，如果目录已经存在会报警告，但是不影响使用  
% mkdir(writedir);  
% % 读取目录内所有所有图像目录信息  
% imnames = dir(readdir);  
% % 去掉目录信息中的无用项( . .. )  
% imnames(1:2)=[];  
% % 统计图像个数  
% imcnt=length(imnames);  
% % 针对每一个图像  
% for imidx = 1:1:imcnt  
%     % 读入图像  
%     imtemp = imread(fullfile(readdir,imnames(imidx).name));  
%     % 改变图像大小  
%     imtemp = imresize(imtemp,resizefactor);  
%     % 按照需要格式写入图像  
%     imwrite(imtemp,fullfile(writedir,[imnames(imidx).name(1:end-3),writetype]));  
% end  
%   
% end  

p = imread('C:\Users\cpeng\Desktop\00000001.jpg');
p2 = imresize(p,[800 1000]);
imwrite(p2,'2.jpg','jpg');





