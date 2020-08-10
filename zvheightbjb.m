(* ::Package:: *)

function [vh]=zvheightbjb (h,n)
% calculates height on n-th bounce if initial height is h, using the rebound
% coeffient defined in the separate function rebound (h)
% n must be a scalar
if length (n)~=1
    error ('Number of bounces must be a scalar in vheight function')
else
if n==0    % initial drop
    vh=h;
else
    for i=1:n
        vh=rebound (h)*h;
        h=vh;  % rebound height is height for next bounce
    end % end for
end % end if n
end  % end if scalar



I have just posted on the project 4 web folder a "template" for vheight (called zvheightbjb.m) that finds the vertical height using an explicit loop.You should be able to use it as a model for both your vheight function& your vvheight function.You can also use explicit loops to build the table for Task 5:nb=[1:nin];% first column indicates number of bounces
h4=[5:5:20];% the heights we want to consider
for i=1:4
h=i*5;% generates 4 starting heights
for n=1:nin
htab (i,n)=distance (h,rin,n);% for fixed height,find distance after n bounces
end
end
You can also use an explicit loop in Task 7:for i=0:nin
vhtab (i+1)=vheight (hin,i);% note subscripting must begin at 1
end
And in Task 9:for i=0:12
vvhtab (i+1)=vvheight (20,i,@rc);% remember subscripting must begin at 1
end

Good luck!
bjb
