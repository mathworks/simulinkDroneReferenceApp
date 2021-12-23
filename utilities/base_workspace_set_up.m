function base_workspace_set_up()

% Load the dictionary data into the workspace
evalin('base', 'dd');

% Load the configuration sets for the models
evalin('base', 'simConfigSet = sim_plant_configset;');

% Check if raspberrypi class (Raspberry Pi Support Package) is in MATLAB path
if exist('raspberrypi','class')
    evalin('base', 'ctrlConfigSet = raspi_ctrl_configset;');
else
    warning('Simulink Support Package for Raspberry Pi Hardware is not installed.');
    evalin('base', 'ctrlConfigSet = sim_plant_configset;');
end

evalin('base', 'slrtConfigSet = slrt_plant_configset;');

end