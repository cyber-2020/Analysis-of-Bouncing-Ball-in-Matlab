function[vd]=distance(h0,r,n)
% calculates vertical distance on n-th bounce if initial height is
% h0,rebound coefficient is r, and number of bounces is n
% n must be a scalar

if n==1
    height=h0*(r^n);
    vd=h0+height;
else
    
c=h0.*(r.^n);
[q,s]=size(c);

if n(1)==0
vd(n+1)=((sum(c))*2)-c(1,1)-c(q,s);    
    
else
vd=((sum(c))*2)-c(1,1)-c(q,s);
end
end