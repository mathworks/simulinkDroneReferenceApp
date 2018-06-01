function rVal = getRanVal (upLimit, lowLimit, scale)
% This function computes a random value between the upLimit and lowLimit.
% It is used when creating random flight scenarios to set up initial flight
% conditions.
% Input arguments:
%  upLimit - number - The maximum value allowed.
%  lowLimit - number - The minimum value allowed.
%  scale - number - Used to multiple the random number and scale it.
%
% Output arguments:
%  rVal - number - Random value between lowLimit and upLimit.
%
%
%  Copyright 2018 The MathWorks, Inc.

% make sure the limits are correct
if upLimit <= lowLimit
    error('Upper limit cannot be smaller or equal to the lower limit');
end

% find a random value
rVal = randn*scale;
while ((rVal < lowLimit) || (rVal>upLimit))
    rVal = randn*scale;
end
rVal = single(rVal);
end