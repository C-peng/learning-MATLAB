clc;clear;

[name x1 y1 x2 y2]= textread('C:\Users\cpeng\Desktop\V000_new.txt','%d %f %f %f %f ');

data=[name x1 y1 x2 y2];

fid = fopen('new.txt','wt');

b=data(:,1);

[c,pos]=sort(b);

data(:,2)=data(pos,2);

data(:,3)=data(pos,3);

data(:,4)=data(pos,4);

data(:,5)=data(pos,5);

data(:,1)=c;


for i=1:size(data)                 
     fprintf(fid,'%d %f %f %f %f\n',data(i,1),data(i,2),data(i,3),data(i,4),data(i,5));                 
end


fclose(fid);