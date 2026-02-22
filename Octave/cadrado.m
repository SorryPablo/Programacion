clear all;clc;
a=zeros(5,8);
for i=1:5
    for j=1:8
        if rem(i,2)~=0
            a(i,j)=(i+j)^2;
        else
            if rem(j,2)~=0
                a(i,j)=(i+j)^2;
            else
                a(i,j)=sqrt(i+j);
            end
        end
    end
end
a