clc;clear;

fid_n=fopen('C:\Users\cpeng\Desktop\V000_new.txt','wt');
[name x1 y1 x2 y2]= textread('C:\Users\cpeng\Desktop\V000.txt','%d %f %f %f %f ');

data=[name x1 y1 x2 y2];
label=1;

for i=1:size(data)                 
     fprintf(fid_n,'I%05d.jpg %d %f %f %f %f\n',data(i,1),label,data(i,2),data(i,3),data(i,2)+data(i,4),data(i,3)+data(i,5));                 
end

fclose(fid_n);