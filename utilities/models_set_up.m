function models_set_up(selectedTask, isInteractiveMode)
%  Copyright 2018 The MathWorks, Inc.

arguments
    selectedTask
    isInteractiveMode {mustBeNonnegative} = false
end

% Load PlantModel to enable setting the configuration set
load_system('PlantModel');

switch selectedTask
    case {eTask.FlightControllerDesign, eTask.TestFlightController, eTask.FlightEnvelopeCharacterization}
        % Set the variant for QGroundControl
        evalin('base', 'useQGC = false;');
        
        % Set the variant for Simulation Mode
        evalin('base', 'simMode=0;');
        
        % Set the variant for Animation Mode
        evalin('base', 'animMode=0;');
        
        % Set Sim as active configuration set for PlantModel
        setActiveConfigSet('PlantModel','Sim');
        
        % Open the Simulation Model
        if isInteractiveMode
            open_system('simModel');
        end
        
        % Let user know config is done
        disp ('Simulation Configuration Completed')
        
    case eTask.TestAutopilotCodeOffline
        % Set the variant for QGroundControl
        evalin('base', 'useQGC = false;');
        
        % Set the variant for Simulation Mode
        evalin('base', 'simMode=1;');
        
        % Set the variant for Animation Mode
        evalin('base', 'animMode=0;');
        
        % Set Sim as active configuration set for PlantModel
        setActiveConfigSet('PlantModel','Sim');
        
        % Open the Simulation Model
        if isInteractiveMode
            open_system('simModel');
        end
        
        % Let user know config is done
        disp ('SIL Configuration Completed')
        
    case eTask.TestAutopilotCodeOnTarget
        % Set the variant for QGroundControl
        evalin('base', 'useQGC = false;');
        
        % Set the variant for Simulation Mode
        evalin('base', 'simMode=2;');
        
        % Set the variant for Animation Mode
        evalin('base', 'animMode=0;');
        
        % Set Sim as active configuration set for PlantModel
        setActiveConfigSet('PlantModel','Sim');
        
        % Open the Simulation Model
        if isInteractiveMode
            open_system('simModel');
        end
        
        % Let user know config is done
        disp ('PIL Configuration Completed')
        
    case eTask.UAVSMECapabilities
        % Set the variant for QGroundControl
        evalin('base', 'useQGC = true;');
        
        % Set the variant for Simulation Mode
        evalin('base', 'simMode=0;');
        
        % Set the variant for Animation Mode
        evalin('base', 'animMode=1;');
        
        % Set Sim as active configuration set for PlantModel
        setActiveConfigSet('PlantModel','Sim');
        
        if isInteractiveMode
            % Open the Simulation Model
            open_system('simModel');
            
            % Launch QGroundControl
            launchQGC;
        end
        
        % Let user know config is done
        disp ('Co-Simulation Configuration Completed')
        
    case eTask.SystemIntegrationTest
        % Set the variant for QGroundControl
        evalin('base', 'useQGC = true;');
        
        % Set the variant for Simulation Mode
        evalin('base', 'simMode=0;');
        
        % Set SLRT as active configuration set for PlantModel
        setActiveConfigSet('PlantModel','SLRT');
        
        if isInteractiveMode
            % Open the Raspberry Pi Autopilot Model
            open_system('raspiAutopilotControlSystem');
            
            % Open the SLRT Plant Model
            open_system('slrtPlantModel');
            
            % Launch QGroundControl
            launchQGC;
        end
        
        % Let user know config is done
        disp ('HIL Configuration Completed')
        
    case eTask.RunRegressionTests
        runTestsuite;
        
    otherwise
        error('Function was called with an unsupported task')
end

end

%% Subfunction launch QGC
function launchQGC

if ismac
    try
        !/Applications/QGroundControl.app/Contents/MacOS/QGroundControl&
    catch
        warning ('Seems like QGroundControl is not properly installed.');
    end
elseif isunix
    % Set here how to launch from Linux
else
    [~,cmdout] = system('tasklist');
    if ~contains(cmdout,'QGroundControl.exe')
        QGCexePath = fullfile(getenv('ProgramFiles'),'QGroundControl\QGroundControl.exe');
        if isfile(QGCexePath)
            % Try starting QGroundControl if not already running
            system(['start "" /b "',QGCexePath,'"']);
        else
            warning('QGroundControl was not found in the default installation path.');
        end
    end
end

end