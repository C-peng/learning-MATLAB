clear all;
close all;
clc;

img=imread('liantong.bmp');
imgn=img>128;
s=uint8(1-imgn);

 %{                     
s=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;       %���������ά���ٿ��еľ���
1 1 1 1 1 1 1 1 0 0 1 1 1 1 0 0;
0 0 1 1 1 1 0 0 0 1 1 1 1 0 0 0;
0 1 1 1 1 0 0 0 1 1 1 0 0 1 1 0;
1 1 1 0 0 1 1 0 0 0 1 1 1 0 0 0;
0 1 1 0 0 0 0 0 1 1 0 0 0 1 1 0;
0 0 0 0 0 1 1 1 1 0 0 1 1 1 1 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%}
imshow(mat2gray(s));
[m n]=size(s);
tmp=zeros(m,n);     %���ͼ��
label=1;
queue_head=1;       %����ͷ
queue_tail=1;       %����β
neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %�͵�ǰ����������ӵõ��˸���������

for i=2:m-1
    for j=2:n-1
        
        if s(i,j)==1 && tmp(i,j) ==0           
            tmp(i,j)=label;
            q{queue_tail}=[i j];        %��Ԫ��ģ����У���ǰ��������
            queue_tail=queue_tail+1;
            
            while queue_head~=queue_tail
                pix=q{queue_head};                
                for k=1:8               %8��������
                    pix1=pix+neighbour(k,:);
                    if pix1(1)>=2 && pix1(1)<=m-1 && pix1(2)>=2 &&pix1(2)<=n-1
                        if s(pix1(1),pix1(2)) == 1 && tmp(pix1(1),pix1(2)) ==0  %�����ǰ������������Ϊ1���ұ��ͼ��������������û�б���ǣ���ô���
                            tmp(pix1(1),pix1(2))=label;
                            q{queue_tail}=[pix1(1) pix1(2)];
                            queue_tail=queue_tail+1;
                        end
                    end
                 end
                queue_head=queue_head+1;
            end
            
            clear q;                %��ն��У�Ϊ�µı����׼��
            label=label+1;
            queue_head=1;
            queue_tail=1;            
        end
    
    end
end
figure,imshow(mat2gray(tmp))