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
arguments
    wpCount (1,1) {mustBeInteger, mustBeLessThanOrEqual(wpCount,9)}
end

% create the array to hold the values
wps = ones(9,3) .* generate_single_wp();

for ii = 2:wpCount
    attempts = 1;
    while attempts < 2000
        % generate the next waypoint
        wp = generate_single_wp();
        
        % check the separation between all WPs
        if(all(norm(wps(1:ii-1,1:2) - wp(1:2)) > 350))
            wps(ii,:) = wp;
            break;
        end
        attempts = attempts+1;
    end
    
end

end

function wp = generate_single_wp()
x_wp = single(randn*700);
y_wp = single(randn*700);
max_z_wp = 500;
min_z_wp = 250;
z_wp = single((max_z_wp-min_z_wp).*rand + min_z_wp);

wp = [x_wp, y_wp, z_wp];
end