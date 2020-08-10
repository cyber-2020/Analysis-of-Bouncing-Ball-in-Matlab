function [vh]=vheight (h,n)
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