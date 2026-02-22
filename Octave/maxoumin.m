clear all;clc;

function [x,y,z]=maxoumin(a,b,c)
    if a~=0
        x=-b/(2*a);y=a*x^2+b*x+c;
        if a>0
            w=2
        else
            w=1
        end
    else
        x=[];y=[];w=0;
    end
    printf('x=%g y=%g z=%g')
end
