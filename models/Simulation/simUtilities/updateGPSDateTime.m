% Get the clock data
%  Copyright 2018 The MathWorks, Inc.

GPSTimeSeed = fix(clock);

disp('Changing the Time Seed for the GPS Clock.')
disp(['Date/Time is now ' string(datetime(GPSTimeSeed))])  
disp(' This is not persisted across MATLAB sessions')