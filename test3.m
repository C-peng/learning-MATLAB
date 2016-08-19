clc;clear;

[name x1 y1 x2 y2]= textread('C:\Users\cpeng\Documents\MATLAB\new.txt','%d %f %f %f %f');

data=[ x1 y1 x2 y2];

fid = fopen('new1.txt','w');
fid2= fopen('new2.txt','w');

num=1;
a=name(1,1);
data_new=data(1,:);

for n=1:size(name)-1;
	
	if(a==name(n+1,1))
	    num=num+1;
		data_new=[data_new;data(n+1,:)];
    else
        fprintf(fid,'V000/I%05d\n%d\n',a,num);
        fprintf(fid2,'V000/I%05d 640 480\n',a);
		for i=1:size(data_new,1)
          fprintf(fid,'%f %f %f %f\n',  data_new(i,1),data_new(i,2),data_new(i,3),data_new(i,4));
		end
		a=name(n+1,1);
		num=1;
        data_new=data(n+1,:);
	end
end

fprintf(fid,'V000/I%05d\n%d\n',a,num);
fprintf(fid2,'V000/I%05d 640 480\n',a);
for i=1:size(data_new,1)
    fprintf(fid,'%f %f %f %f\n', data_new(i,1),data_new(i,2),data_new(i,3),data_new(i,4));
end
	 
fclose(fid);
fclose(fid2);