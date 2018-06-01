function models_set_up (selectedTask)
%  Copyright 2018 The MathWorks, Inc.

% Determine if the worksapce is empty
C = evalin('base','who;');

% If not empty, Warn the user about clearing the worksapce
choice = 'Yes';

if isempty(C) ~= 1
    choice = questdlg('This  script will clear the Base Workspace before setting up the Simulation task. Do you wish to Continue?', ...
                    'Clear Base Workspace', ...
                    'Yes','No', 'Yes');
end

if strcmp(choice, 'Yes')
    % close the open models
    models_clean_up;
    
    % Clear the workspace
    evalin('base', 'clearvars;');
    
    % Load the dictionary data into the workspace
    evalin('base', 'dd;'); 
    
    switch selectedTask
        case eTask.FlightControllerDesign
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;'); 
            evalin('base', 'ctrlConfigSet = ctrl_configset;'); 
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 0;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            % Open the Simulation Model
            uiopen('simModel',1);
            
            
            % Let user know config is done
            clc;
            disp ('Simulation Configuration Completed')
            
        case {eTask.TestFlightController, eTask.FlightEnvelopeCharacterization}
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;'); 
            evalin('base', 'ctrlConfigSet = ctrl_configset;'); 
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 0;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            load_system('PlantModel');
            
            % Let user know config is done
            clc;
            disp ('Parallel Simulation Configuration Completed')
            
        case eTask.UAVSMECapabilities
            
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;');
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 1;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            % Open the Simulation Model
            uiopen('simModel',1);
            
            clc;
            % Launch QGroundControl
            if ismac
                try
                    !/Applications/QGroundControl.app/Contents/MacOS/QGroundControl&
                catch ME %#ok<NASGU>
                    disp ('Seems like QGroundControl is not properly installed');
                end
            elseif isunix
                % Set here how to launch from Linux
            else
                %set here how to launch from Windows
            end
            
            % Let user know config is done
            
            disp ('Co-Simulation Configuration Completed')
            
        case eTask.SystemIntegrationTest
            
            % Load the configuration set for the autopilot model
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 1;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            % Open the Raspberry Pi Autopilot Model
            uiopen('raspiAutopilotControlSystem',1);
            
            clc;
            
            % if in Windows, open the SLRT model too
            if ~ismac && ~isunix
                %set here how to launch from Windows
                evalin('base', 'plantConfigSet = slrt_plant_configset;'); 
                
                % Open the Raspberry Pi Autopilot Model
                uiopen('slrtPlantModel',1);
            end
            
            % Launch QGroundControl
            if ismac
                try
                    !/Applications/QGroundControl.app/Contents/MacOS/QGroundControl&
                catch ME %#ok<NASGU>
                    disp ('Seems like QGroundControl is not properly installed');
                end
            elseif isunix
                % Set here how to launch from Linux
            else
                %set here how to launch from Windows
            end
            
            
            % Let user know config is done
            disp ('HIL Configuration Completed')
            
        otherwise
            error('Function was called with an unsupported task')
    end


    
    
end