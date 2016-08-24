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
```matlab
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

```

4.如何将一个行向量添加到另一个矩阵中
--

```matlab
>> A=[1 1 1 2 2 2];
>> B=[7 7 7 7 7 7;8 8 8 8 8 8];
>> C=[A;B]

C=

1 1 1 2 2 2
7 7 7 7 7 7
8 8 8 8 8 8
```
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

## 11.dir ##