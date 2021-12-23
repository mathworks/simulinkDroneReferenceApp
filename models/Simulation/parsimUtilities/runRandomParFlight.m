% Script shortcut to run local parallel simulation
%  Copyright 2018 The MathWorks, Inc.
% Set the number of local sims to run
n = 8;

% Let user know how many parsims
disp(['Running ' num2str(n) ' Parallel Simulations. Edit runRandomParFlight.m to change this number']);

% Run the simulations
[simIn, simOut] = runparsim(n, 1000);