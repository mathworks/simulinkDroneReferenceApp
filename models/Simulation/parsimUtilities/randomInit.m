%% Script written to overide the initial conditions of the UAV
% Copyright 2018 The MathWorks, Inc.

% No pausing on plotting
pauseOn = 1;

%% Random Position
x_ic = single(randn*100);
y_ic = single(randn*100);
z_ic = getRanVal(500,250,1000);

Pos_0 = double([x_ic y_ic z_ic]);
uav.ic.Pos_0 = round(Pos_0');

%% Random Heading
psi_ic = getRanVal(2*pi,0,2*pi) - pi;
Euler_0 = double([0; 0; psi_ic]');
uav.ic.Euler_0 = Euler_0';

% Random Commanded Airspeed
U_comm = getRanVal(35,18,40);

% Random WPs
wpCount = uint8(floor(getRanVal(9,5,9)));
wps = random_waypoint_generator(wpCount);

% assemble the variables for Simulink
Xpoints = round(wps(:,1)');
Ypoints = round(wps(:,2)');
Zpoints = round(wps(:,3)');

%% Random Wind
windBase = getRanVal(7.5,3.5,10);
windDirTurb = getRanVal(360,0,360);
windDirHor = getRanVal(360,0,360);

