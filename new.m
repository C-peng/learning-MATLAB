
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
	
	
	