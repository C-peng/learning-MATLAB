% function [ ] = photoresize( readdir )  
% % ͼ�������Ĵ�С����  
% % ���������readdir  ��Ҫ�Ĵ�С��ͼ������Ŀ¼(Ҫ��ֻ��ͼ���ļ�����ʽ����ν)  
%   
% % д��ͼ���ʽ  
% writetype = 'jpg';  
% % д��ͼ��Ŀ¼��ֱ�Ӹ����ڶ�ȡĿ¼�����"png resize"  
% writedir = [readdir,' resize ',writetype];  
% % ��С�ı����ӣ������ֱ�ʾ�������������߳ߴ�  
% resizefactor = 0.2451;  
% % resizefactor = [800 600];  
% % �����Ĵ�С֮��ͼ��Ŀ¼�����Ŀ¼�Ѿ����ڻᱨ���棬���ǲ�Ӱ��ʹ��  
% mkdir(writedir);  
% % ��ȡĿ¼����������ͼ��Ŀ¼��Ϣ  
% imnames = dir(readdir);  
% % ȥ��Ŀ¼��Ϣ�е�������( . .. )  
% imnames(1:2)=[];  
% % ͳ��ͼ�����  
% imcnt=length(imnames);  
% % ���ÿһ��ͼ��  
% for imidx = 1:1:imcnt  
%     % ����ͼ��  
%     imtemp = imread(fullfile(readdir,imnames(imidx).name));  
%     % �ı�ͼ���С  
%     imtemp = imresize(imtemp,resizefactor);  
%     % ������Ҫ��ʽд��ͼ��  
%     imwrite(imtemp,fullfile(writedir,[imnames(imidx).name(1:end-3),writetype]));  
% end  
%   
% end  

p = imread('C:\Users\cpeng\Desktop\00000001.jpg');
p2 = imresize(p,[800 1000]);
imwrite(p2,'2.jpg','jpg');





