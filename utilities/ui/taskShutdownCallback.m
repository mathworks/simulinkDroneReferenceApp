function abort = taskShutdownCallback(sel_task)
% This function tears down the specified task
%
% Copyright 2018 The MathWorks, Inc.
abort = false;

switch sel_task
    case eTask.FlightControllerDesign
        model_list = {'simModel'};       
    case eTask.UAVSMECapabilities
        model_list = {'simModel'};
    case eTask.SystemIntegrationTest
        model_list = {'raspiAutopilotControlSystem', 'slrtPlantModel'};
    case eTask.TestAutopilotCodeOffline
        model_list = {'simModel'};
    case eTask.TestAutopilotCodeOnTarget
        model_list = {'simModel'};
    case eTask.TestFlightController
        model_list = {};
    case eTask.FlightEnvelopeCharacterization
        model_list = {};
    case eTask.RunRegressionTests
        model_list = {};
    otherwise
        error('Unsupported task in taskShutdownCallback')
end

for model_ctr = 1:length(model_list)
    model = model_list{model_ctr};
    if bdIsLoaded(model)
        if isequal(get_param(model, 'Dirty'), 'off')
            close_system(model, 0);
        else
            message_str = ['Do you want to lose all unsaved changes to model ' char(model) ' ? Y/N [Y]:'];
            choice = questdlg(char(message_str), ...
                'Lose unsaved changed?', 'Yes', 'No', 'No');

            % Handle response
            switch choice
                case 'Yes'
                    close_system(model, 0);
                case 'No'
                    % Skip the rest of the operation
                    abort = true;
                otherwise
                    % Skip the rest of the operation
                    abort = true;
            end
        end
    end
end % for model_ctr = 1:length(models_to_close)

if ~abort
    %Shut down the current task
    evalin('base', 'clearvars');
end

