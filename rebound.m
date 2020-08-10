function [rebCof]=rebound(h);
% calculates rebound coefficient on n-th bounce if initial height is h,
% n must be a scalar
if h<=0
    disp('Error: Number of bounces must be positive in current height!')
else

  if h<10      % current height
    rebCof=0.6; %rebCof is the rebound coefficient found by the given current height
  else
    rebCof=0.8; 
  
  end % end if h
end  % end if scalar