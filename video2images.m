%% 从视频里面分割图片
clc;
clear;
%% 读取视频
video_file='E:\BaiduYunDownload\DJI_0002.MOV';
video=VideoReader(video_file);
frame_number=floor(video.Duration * video.FrameRate);
%% 分离图片
for i=1:frame_number
    a=sprintf('%08d',i);
    image_name=strcat('vot\',num2str(a));
    image_name=strcat(image_name,'.jpg');
    I=read(video,i);            %读出图片
    imwrite(I,image_name,'jpg');      %写图片
    I=[];
end


