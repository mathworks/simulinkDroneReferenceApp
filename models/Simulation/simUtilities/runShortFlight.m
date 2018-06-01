% Script shortcut to run a short flight in an L pattern
%
%  Copyright 2018 The MathWorks, Inc.

 
model = 'simModel';

%% Get the model configuration to reset it after sim
set_param([model '/Simulation Pace'], 'Commented', 'on');
x = get_param(model, 'StopTime');
set_param(model, 'StopTime', '425');
activeVariant = get_param([model '/Unmanned Airplane Flight Operator /GS Commands Variant'],'OverrideUsingVariant');

%% Sim the model
set_param([model '/Unmanned Airplane Flight Operator /GS Commands Variant'],'OverrideUsingVariant', 'useSL');
simout = sim(model); 

%% Reset the model configuration to what it was before the sim
set_param([model '/Simulation Pace'], 'Commented', 'off')
set_param(model, 'StopTime', x);
set_param([model '/Unmanned Airplane Flight Operator /GS Commands Variant'],'OverrideUsingVariant', activeVariant);

%% Plot the flight results and clean up variables.
PlotFlightResults(simout);

clear model x simout activeVariant;