function models_set_up (selectedTask)
%  Copyright 2018 The MathWorks, Inc.

% Determine if the worksapce is empty
C = evalin('base','who;');

% If not empty, Warn the user about clearing the worksapce
choice = 'Yes';

if ~isempty(C)
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
        case {eTask.FlightControllerDesign, eTask.TestFlightController, eTask.FlightEnvelopeCharacterization}
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;');
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 0;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            % Open the Simulation Model
            open_system('simModel');
            
            % Let user know config is done
            disp ('Simulation Configuration Completed')
            
        case eTask.TestAutopilotCodeOffline
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;');
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 0;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=1;');
            
            % Open the Simulation Model
            open_system('simModel');
            
            % Let user know config is done
            disp ('SIL Configuration Completed')
            
        case eTask.TestAutopilotCodeOnTarget
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;');
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 0;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=2;');
            
            % Open the Simulation Model
            open_system('simModel');
            
            % Let user know config is done
            disp ('PIL Configuration Completed')

        case eTask.UAVSMECapabilities
            
            % Load the configuration sets for the models
            evalin('base', 'plantConfigSet = sim_plant_configset;');
            evalin('base', 'ctrlConfigSet = ctrl_configset;');
            
            % Set the variant for QGroundControl
            evalin('base', 'QGC = 1;');
            
            % Set the variant for Simulation Mode
            evalin('base', 'simMode=0;');
            
            % Open the Simulation Model
            open_system('simModel');
            
            % Launch QGroundControl
            launchQGC;
            
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
            open_system('raspiAutopilotControlSystem');
            
            clc;
            
            % if in Windows, open the SLRT model too
            if ~ismac && ~isunix
                %set here how to launch from Windows
                evalin('base', 'plantConfigSet = slrt_plant_configset;');
                
                % Open the Raspberry Pi Autopilot Model
                open_system('slrtPlantModel');
            end
            
            % Launch QGroundControl
            launchQGC;
            
            % Let user know config is done
            disp ('HIL Configuration Completed')
            
        otherwise
            error('Function was called with an unsupported task')
    end
    
end

end

function launchQGC
if ismac
    try
        !/Applications/QGroundControl.app/Contents/MacOS/QGroundControl&
    catch ME %#ok<NASGU>
        disp ('Seems like QGroundControl is not properly installed');
    end
elseif isunix
    % Set here how to launch from Linux
else
    % Set here how to launch from Windows
    try
        [~,cmdout] = system('tasklist');
        if ~contains(cmdout,'QGroundControl.exe')
            system(['start "" /b "',fullfile(getenv('ProgramFiles(x86)'),'QGroundControl\QGroundControl.exe"')]);
        end
    catch ME
        disp ('Seems like QGroundControl is not installed');
    end
end
end