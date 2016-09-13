matlab编程
==
1.在matlab里如何获得一个矩阵的行数或列数
--
比如矩阵A=[1,2,3;2,3,4]

行数为size(A,1)=2

列数size(A,2)=3
2.matlab中怎样提取矩阵里的某一个元素
--
既可以用数组名跟圆括号，行号，列号表示，又可以用一个参数表示。注意一个参数表示时，MATLAB是列优先的，千万别弄错。例如：A=[1,2,3;4,5,6;7,8,9]; 则A（2，1）=4。千万别写成A[2,1]!  如果用一维表示是：A(2)=4, 千万别写成A(4)!   不信你可以上机试试。

3.简单示例
---
	
	[name score x1 y1 x2 y2]= textread('F:\张达敏给我传的资料\faster-rcnn\faster_rcnn-master\cw2.txt','%d %f %f %f %f %f');
	data=[score x1 y1 x2 y2];
	
	fid = fopen('new.txt','w');
	
	num=1;
	a=name(1,1);
	data_new=data(1,:);
	
	for n=1:size(name)-1;
		
		if(a==name(n+1,1))
		    num=num+1;
			data_new=[data_new;data(n+1,:)];
	    else
	        fprintf(fid,'%d\n%d\n',a,num);
			for i=1:size(data_new,1)
	          fprintf(fid,'%f %f %f %f %f\n',  data_new(i,2),data_new(i,3),data_new(i,4)-data_new(i,2),data_new(i,5)-data_new(i,3), data_new(i,1));
			end
			a=name(n+1,1);
			num=1;
	        data_new=data(n+1,:);
		end
	end
	
	fprintf(fid,'%d\n%d\n',a,num);
	for i=1:size(data_new,1)
	    fprintf(fid,'%f %f %f %f %f\n',  data_new(i,2),data_new(i,3),data_new(i,4)-data_new(i,2),data_new(i,5)-data_new(i,3), data_new(i,1));
	end
		 
	fclose(fid);



4.如何将一个行向量添加到另一个矩阵中
--


	>> A=[1 1 1 2 2 2];
	>> B=[7 7 7 7 7 7;8 8 8 8 8 8];
	>> C=[A;B]
	
	C=
	
	1 1 1 2 2 2
	7 7 7 7 7 7
	8 8 8 8 8 8

5.在matlab中安装Piotr's Computer Vision Matlab Toolbox工具箱
---
（1）打开MATLAB

（2）在MATLAB中输入
    addpath(genpath('D:\piotr_toolbox\toolbox'));

（3）输入`savepath`

（4）输入`toolboxCompile`

6.如何将seq文件转化为image
--
在安装完上面的工具箱后执行以下代码

	seqIo('/home/cpeng/liubo/data/set00/V000.seq','toImgs','/home/cpeng/liubo/data/set00/V000')

7.如何将vbb文件转化为txt
--
使用代码vbb（‘vbbsaveTXT’，‘...’，‘...’）（使用2013，2014会有错误）

8.MATLAB读取文件的操作（有待加强）
--

低端操作

fgetl读入一行，忽略换行符

fgets
读入一行，直到换行符


strread
读取string


高端操作

	[names, types, x, y, answer] = textread('D:\mat.txt','%s %s %f %d %s', 1)
	
	[names, levelnum, x, y, answer] = textread(filename , ... '%s Level%d %f %d %s', 1)
	
	textread(filename,'%s%f-%f-%f%f:%f%f','headerlines',1,'delimiter'  ,';');
	
	[name   answer]=textread('my_exam.dat','%s %*s %*f %s')

9.MATLAB中的排序
--

假如a是一个2*n的矩阵,即两行.

b=a(1,:);

[c,pos]=sort(b);%pos为排序后的下标,c为第一行的排序结果;

a(2,:)=a(2,pos);%第二行按照第一行排序的下标对应

a(1,:)=c;%第一行结果重新赋给a 的第一行

10.MATLAB中的cell
--
取值用{}

## 11.MATLAB中的dir函数 ##

## 12.MATLAB实现裁剪图片部分区域 ##

imcrop函数的使用

    clear,clc
    close all
	img = imread('3.jpg');
	% img =rgb2gray(img);
	im =imcrop(img,[497,589,361,37]);
	imshow(im);
	T = graythresh(im);
	I = im2bw(im,T);
	imshow(I);


## 13.如何将带跟踪边框的figure保存到图片中？ ##

请问用matlab在二值图像上画了一个红框，之后怎么把这个图像帮存下来（连红框一起保存），画框的方法用的是rectangle和drawnow两个函数，但是用imwrite保存就没有红框了，用saveas保存的又有一个白色的边框，请求帮助！

	state = regionprops(fg_bw,'Area','BoundingBox');
	fg_bw_m = cat(3,fg_bw,fg_bw,fg_bw);   %change to 3-D matrix
	    for l=1:length(state);
	        if (state(l).Area >150)
	            ax = fix(state(l).BoundingBox); %change float to integer
	            fg_bw_m(ax(2),ax(1):ax(1)+ax(3)) = 1; %change pixvalue to red color
	            fg_bw_m(ax(2)+ax(4),ax(1):ax(1)+ax(3)) = 1;   
	            fg_bw_m(ax(2):ax(2)+ax(4),ax(1)) = 1;     %set left and right side to red color
	            fg_bw_m(ax(2):ax(2)+ax(4),ax(1)+ax(3)) = 1;
	        end
	    end

## 14.matlab中如何在同一figure中显示多幅图像 ##

写成subplot（m,n,p）或者subplot（mnp）。
subplot是将多个图画到一个平面上的工具。其中，m表示是图排成m行，n表示图排成n列，也就是整个figure中有n个图是排成一行的，一共m行，如果第一个数字是2就是表示2行图。p是指你现在要把曲线画到figure中哪个图上，最后一个如果是1表示是从左到右第一个位置。

	>> t=0:0.001:1;
	>> y1=sin(10*t);
	>> y2=sin(15*t);
	>> subplot(211)
	>> plot(t,y1)
	>> subplot(212)
	>> plot(t,y2)


另一个例子：

	两张图片在一个窗口中显示：
	hehe=uint8(hehe);
	figure(1)
	subplot(2,1,1);imshow(he),title('原始图像'); %显示原始图像
	%figure(2)
	subplot(2,1,2);imshow(hehe),title('SLIC分割k=400,m=40'); %显示超像素分割图像

