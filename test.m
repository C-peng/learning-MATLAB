clc;clear;
fid = fopen('C:\Users\cpeng\Desktop\V000.txt', 'r');
fid_n=fopen('C:\Users\cpeng\Desktop\V000_new.txt','wt');
while ~feof(fid)
    tline=fgetl(fid);
    if ~isempty(tline)
        if tline(1)=='l'&&tline(2)=='b'&&tline(3)=='l'
            [s,e]=strread(tline,'%*s %*s %*s %d %*s %d %*s %*c','delimiter', '= ');
%             fprintf(fid_n,'%d %d\n',s,e);
%              clear s e;
            tline=fgetl(fid);
            data=strread(tline,'%s','delimiter', '; ');
%             num=size(data);
             a= data{2,1}(3:end);
             data{2,1}=a;
             k=2;
             for i=s:e                 
                 fprintf(fid_n,'%d %s %s %s %s\n',i,data{k,1},data{k+1,1},data{k+2,1},data{k+3,1});
                 k=k+4;
                 
             end
            
          
            
        end
%         if double(tline(1))>=48 && double(tline(1))<=57  %数值开始
%             a=strread(tline);
%             a(3:4)=[];
%             fprintf(fid_n,'%f %f\n',a);
%             clear a;
%         elseif double(tline(1))==67   %字母C开始
%            [b1,b2,b3,b4]=strread(tline,'%s %s %s %s');
%            b=[b1{1},'  ',b2{1}];
%             fprintf(fid_n,'%s\n',b);
%             clear b b1 b2 b3 b4;
%         else
%             fprintf(fid_n,'%s\n',tline);
%         end
%     else
%         fprintf(fid_n,'%s\n',tline);
    end
end
fclose(fid);
fclose(fid_n);