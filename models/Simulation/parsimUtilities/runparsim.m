function [simIn, simOut] = runparsim(num_runs, simTime, cluster_profile)
%   runparsim  Run a given number of flights in parallel using
%   parsim
%
% Input arguments:
%  numRuns - number - number of simulations to run.
%  use_mdcs - boolean - if 0, run locally, use MDCS otherwise
%  cluster_profile - if use_mdcs~=0, you must provide a cluster profile to
%  run in MDCS
%
% Output arguments:
%  simIn - Simulink.SimulationInput containing the input values to the Simulation
%  simOut - simStruct containing the results of the simulaiton
%
%  Copyright 2018 The MathWorks, Inc.
arguments
    num_runs (1,1) {mustBePositive}
    simTime (1,1) {mustBeNonnegative} = 425;
    cluster_profile (1,:) = '';
end

% Function parameters
maxWPnum = 9;
minWPnum = 5;
model = 'simModel';

simIn(1:num_runs) = Simulink.SimulationInput(model);

for sim_ctr = 1:num_runs
    
    % Random number of waypoints
    wpCount = round((maxWPnum-minWPnum).*rand + minWPnum);
    wps = random_waypoint_generator(wpCount);
    
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('Xpoints', round(wps(:,1)'));
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('Ypoints', round(wps(:,2)'));
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('Zpoints', round(wps(:,3)'));
    
    % Random Heading
    psi_ic = 2*pi*rand-pi;
    Euler_0 = [0; 0; psi_ic]';
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('uav.ic.Euler_0', Euler_0');
    
    % Random Position
    x_ic = randn*100;
    y_ic = randn*100;
    z_ic = 250*rand+250;
    
    Pos_0 = [x_ic y_ic z_ic];
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('uav.ic.Pos_0', round(Pos_0'));
    
    % Random Commanded Airspeed
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('U_comm', 17*rand+18);
    
    % Random Wind Conditions
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('windBase', 4*rand+3.5);
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('windDirTurb', 360*rand);
    simIn(sim_ctr) = simIn(sim_ctr).setVariable('windDirHor', 360*rand);
end

simIn = simIn.setModelParameter('StopTime',num2str(simTime));

% Check if a cluster is already started
poolObj = gcp('nocreate');
% Create a new pool, if one does not exist
if isempty(poolObj)
    % If a cluster profile is not given to the function, use the default
    % cluster
    if ~isempty(cluster_profile)
        parpool(cluster_profile);
    else
        parpool;
    end
end

% Start parallel simulation
simOut = parsim(simIn,...
    'ShowProgress', 'on', ...
    'ShowSimulationManager', 'off', ... %speeds up the sim
    'TransferBaseWorkspaceVariables','on',...
    'UseFastRestart','on',...
    'AttachedFiles','interfaceDefinition.h');

% Plot results
for idx = 1:num_runs
    if isempty(simOut(idx).ErrorMessage)
        % Plot the results when the simulation finishes
        disp(['Simulation #' num2str(idx) ' successful.'])
        PlotFlightResultsFcn(simIn(idx), simOut(idx));
    else
        % Otherwise, print out an error message
        disp(['Error occurred during simulation #' num2str(idx) ':\n' ...
            simOut(idx).ErrorMessage])
    end
end

end