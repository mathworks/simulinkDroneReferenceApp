function taskStartupCallback(sel_task)
% This function sets up the task.
%
% Copyright 2018 The MathWorks, Inc.
switch sel_task   
    case eTask.FlightControllerDesign
        model_list = {'simModel'};
        evalin('base', 'dd; plantConfigSet = sim_plant_configset; ctrlConfigSet = ctrl_configset; QGC = 0; simMode=0;');
    case eTask.UAVSMECapabilities
        model_list = {'simModel'};
        evalin('base', 'dd; plantConfigSet = sim_plant_configset; ctrlConfigSet = ctrl_configset; QGC = 1; simMode=0;');
    case eTask.SystemIntegrationTest
        if ismac || isunix
            model_list = {'raspiAutopilotControlSystem'};
            evalin('base', 'plantConfigSet = sim_plant_configset;');
        else
            model_list = {'raspiAutopilotControlSystem', 'slrtPlantModel'};
            evalin('base', 'plantConfigSet = slrt_plant_configset;');
        end
        evalin('base', 'dd; ctrlConfigSet = ctrl_configset; QGC = 1; simMode=0;');
    case eTask.TestAutopilotCodeOffline
        model_list = {'simModel'};
        evalin('base', 'dd; plantConfigSet = sim_plant_configset; ctrlConfigSet = ctrl_configset; QGC = 0; simMode=1;');
    case eTask.TestAutopilotCodeOnTarget
        model_list = {'simModel'};
        evalin('base', 'dd; plantConfigSet = sim_plant_configset; ctrlConfigSet = ctrl_configset; QGC = 0; simMode=2;');
    case eTask.TestFlightController
        model_list = {};
        evalin('base', 'dd;');
    case eTask.FlightEnvelopeCharacterization
        model_list = {};
        evalin('base', 'dd;');
        
    otherwise
        error('Unsupported task in taskStartupCallback')
end

for model_ctr = 1:length(model_list)
    model = model_list{model_ctr};
    open_system(model);
end

