function wps = random_waypoint_generator(wpCount)
% This function generates a given number of random waypoints that are a minimum
% distance from each other.
% Input arguments:
%  wpCount - number - The number of desired waypoints. It can not exceed 9.
%
% Output arguments:
%  wps - array - Waypoint array produced by the function
%
%  Copyright 2018 The MathWorks, Inc.

wpCount = min(9, wpCount);

% generate the next waypoint
x_wp = single(randn*700);
y_wp = single(randn*700);
z_wp = getRanVal(500,250,1000);

% create the array to hold the values
wps = ones(9,3) .* [x_wp, y_wp, z_wp];

for ii = 2:wpCount
    reiterate = 1; 
    attempts = 0;
    while (reiterate == 1) && (attempts < 2000)
        reiterate = 0;

        % generate the next waypoint
        x_wp = randn*700;
        y_wp = randn*700;
        z_wp = getRanVal(500,250,1000);

        % check the separation between all WPs
        for mm = 1:(ii-1)
           if (norm(wps(mm,1:2)-wps(mm+1,1:2)) < 350)
               reiterate = 1;
           end
        end
        attempts = attempts+1;
    end

    wps(ii,:) = [x_wp, y_wp, z_wp];
end

