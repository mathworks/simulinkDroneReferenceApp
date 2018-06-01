%  This Script tears down the loaded models and the variables
%  Copyright 2018 The MathWorks, Inc.

% List of models
model_list = {'simModel', 'raspiModel', 'slrtPlantModel', ...
              'AutopilotControlSystem', 'raspiAutopilotControlSystem', ...
              'PlantModel', 'slrtPlantModel'};

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

