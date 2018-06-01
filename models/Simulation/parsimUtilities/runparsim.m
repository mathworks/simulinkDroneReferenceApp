function [simIn, simOut] = runparsim(num_runs, use_mdcs, cluster_profile)
%   runparsim  Run a given number of flights  in parallel using
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
    model = 'simModel';
    n = num_runs; % n - no of simulations
    simIn(1:n) = Simulink.SimulationInput(model);

    for sim_ctr = 1:n

        % Random number of waypoints
        wpCount = uint8(floor(getRanVal(9,5,9)));
        wps = random_waypoint_generator(wpCount);
        
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('Xpoints', round(wps(:,1)'));
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('Ypoints', round(wps(:,2)'));
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('Zpoints', round(wps(:,3)'));

        % Random Heading
        psi_ic = getRanVal(2*pi,0,2*pi) - pi; %[-pi, pi]
        Euler_0 = double([0; 0; psi_ic]');        
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('uav.ic.Euler_0', Euler_0');
        
        % Random Position
        x_ic = single(randn*100);
        y_ic = single(randn*100);
        z_ic = getRanVal(500,250,1000);

        Pos_0 = double([x_ic y_ic z_ic]);
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('uav.ic.Pos_0', round(Pos_0'));
        
        % Random Commanded Airspeed
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('U_comm', getRanVal(35,18,40));
        
        % Random Wind Conditions
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('windBase', getRanVal(7.5,3.5,10));
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('windDirTurb', getRanVal(360,0,360));
        simIn(sim_ctr) = simIn(sim_ctr).setVariable('windDirHor', getRanVal(360,0,360));
    end

    simIn = simIn.setModelParameter('StopTime','1000');
    simIn = simIn.setBlockParameter([model '/Simulation Pace'], 'Commented', 'on');
    simIn = simIn.setBlockParameter([model '/Unmanned Airplane Flight Operator /GS Commands Variant'], ...
        'OverrideUsingVariant', 'useSL');
    if use_mdcs
        parpool(cluster_profile);
    end
    simOut = parsim(simIn,'SetupFcn',@setup_sim,...
        'ShowProgress', 'on', ...
        'ShowSimulationManager', 'off', ... %speeds up the sim
        'AttachedFiles', {'dd.m','sim_plant_configset.m','ctrl_configset.m'});
    % Plot results
    for idx = 1:n
        if isempty(simOut(idx).ErrorMessage)
            % Plot the results when the simulation finishes
            disp(['Simulation #' num2str(idx) ' successful'])
            PlotFlightResultsFcn(simIn(idx), simOut(idx));
        else
            % Otherwise, print out an error message
            disp(['Error occurred during simulation #' num2str(idx) ':\n' ...
                simOut(idx).ErrorMessage])
        end
    end
end

function setup_sim()
    % initialize the workspace
    evalin('base','dd; plantConfigSet = sim_plant_configset; ctrlConfigSet=ctrl_configset;');
    load_system('PlantModel');
end


