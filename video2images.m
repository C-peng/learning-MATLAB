%% ����Ƶ����ָ�ͼƬ
clc;
clear;
%% ��ȡ��Ƶ
video_file='E:\BaiduYunDownload\DJI_0002.MOV';
video=VideoReader(video_file);
frame_number=floor(video.Duration * video.FrameRate);
%% ����ͼƬ
for i=1:frame_number
    a=sprintf('%08d',i);
    image_name=strcat('vot\',num2str(a));
    image_name=strcat(image_name,'.jpg');
    I=read(video,i);            %����ͼƬ
    imwrite(I,image_name,'jpg');      %дͼƬ
    I=[];
end


