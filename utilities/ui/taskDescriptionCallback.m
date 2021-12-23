function [new_description, disabled] = taskDescriptionCallback(task)
% This function determines what the description should say given the 
% installed toolboxes and support packages.
%
% Copyright 2018 The MathWorks, Inc.
    disabled = false;

    % These are the toolboxes needed to run ALL of the models
    [tlbox_not_installed, spkg_not_installed, no_license] = taskToolboxStatus(task);
    
    all_good = isempty(tlbox_not_installed) && isempty(spkg_not_installed) && isempty(no_license);

    if all_good
        switch task
            case eTask.FlightControllerDesign
                new_description = ['Enable a control systems engineer to develop a UAV autopilot' ... 
                    ' and test its behavior in a realistic 6DOF aircraft simulation. '];        
            case eTask.TestFlightController
                 new_description = ['Enable a Controls System Engineer to rapidly assess the performance' ... 
                     ' of an autopilot under many conditions.  This command should be executed at' ...
                     ' the command line to start the process: ' char(13) ' >> runparsim(<num sims>, 0, '''')'];
            case eTask.FlightEnvelopeCharacterization
                 new_description = ['Enable a Flight Engineer to rapidly characterize the aircraft�s' ... 
                     ' performance under a wide range of environmental and initial conditions.   One' ... 
                     ' of the commands below should be executed at' ...
                     ' the command line to start the process: ' char(13)];
                
                 clstr_profs = parallel.clusterProfiles;
                 for idx = 1:length(clstr_profs)
                     new_description = [new_description '>> runparsim(<num sims>, 1, ''' clstr_profs{idx} ''')' char(13)]; %#ok<AGROW>
                 end

            case eTask.UAVSMECapabilities
                new_description = ['Demonstrate, early in the design process, the UAV�s' .... 
                    ' capabilities to a Subject Matter Expert and gather feedback on usability and its functionality. '];
                
            case eTask.TestAutopilotCodeOffline
                new_description = ['Test the autopilot�s generated code on a personal' ... 
                    ' computer for same results (within bounds) of the designed autopilot. '];
                
            case eTask.TestAutopilotCodeOnTarget
                new_description = ['Test the autopilot�s generated code on a development' ... 
                    ' board for same results (within bounds) of the designed autopilot.' ];
                
            case eTask.SystemIntegrationTest
                new_description = ['Test the autopilot controller deployed in the' ... 
                    ' development board with real-time simulated data from a realistic' ... 
                    ' 6DOF aircraft simulation'];
                
            case eTask.RunRegressionTests
                new_description = 'Run Regression tests locally.';
                
            otherwise
                error('Unsupported task in taskDescriptionCallback')
        end
    else
        switch task
            case eTask.FlightControllerDesign
                new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);
                disabled = true;

            case eTask.TestFlightController
                pct_match = contains(tlbox_not_installed, 'Parallel Computing Toolbox');
                if length(tlbox_not_installed) == 1 && any(pct_match)
                    new_description = ['Enable a Controls System Engineer to rapidly assess the performance' ... 
                     ' of an autopilot under many conditions.  This command should be executed at' ...
                     ' the command line to start the process: ' char(13) ' >> runparsim(<num sims>,0, '''')' ...
                        char(13) char(13) 'Parallel Computing Toolbox is not installed, so the simulation will run serially.'];
                else
                    new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);            
                    disabled = true;
                end

            case eTask.FlightEnvelopeCharacterization
                new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);                
                disabled = true;
                
            case eTask.UAVSMECapabilities
                new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);            
                disabled = true;
                
            case eTask.TestAutopilotCodeOffline
                % Special logic needed to take into account the raspberry pi
                new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);
                if ~isempty(new_description)
                    disabled = true;
                end
                
                %Check Support packages                
                rpi_match = contains(spkg_not_installed, 'Simulink Support Package for Raspberry Pi Hardware');
                if any(rpi_match)
                    new_description = [new_description char(13) char(13) 'The Simulink Raspberry Pi support package needs to be installed to build and download to the Raspberry Pi.'];
                end
            case eTask.TestAutopilotCodeOnTarget            
                new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);
                disabled = true;
                
            case eTask.SystemIntegrationTest
                % Special logic needed to take into account the raspberry pi
                % and slrt
                if ismac || isunix
                    %Remove SLRT from list if this is a mac or linux.  Instead, add
                    %warning about the ability to execute SLRT plant model
                    slrt_str = 'Simulink Real-Time is not available on the Mac or Linux.  The plant model can be viewed only.';
                    tlbox_not_installed = setdiff(tlbox_not_installed, {'MATLAB Coder', 'Simulink Real-Time'});
                else
                    slrt_str = '';
                end
                
                if ~isempty(tlbox_not_installed)
                    new_description = descriptionForUninstalledToolboxes(tlbox_not_installed);
                    disabled = true;
                else
                    new_description = ['This task is intended to demonstrate the interaction in a hardware in the loop' ...
                        'system.  There are two models, one for the controller on a Raspberry Pi and one for the ' ...
                        'plant which will run via Simulink Real Time.'];
                end
                
                if ~isempty(slrt_str)
                    new_description = [new_description char(13) char(13) slrt_str]; 
                end
                
                %Check Support packages                
                rpi_match = contains(spkg_not_installed, 'Simulink Support Package for Raspberry Pi Hardware');
                if any(rpi_match)
                    new_description = [new_description char(13) char(13) 'The Simulink Raspberry Pi support package needs to be installed to build and download to the Raspberry Pi.'];
                end

            otherwise
                error('Unsupported task in taskDescriptionCallback')
        end

    end
end

function description_str = descriptionForUninstalledToolboxes(toolboxes)

    if ~isempty(toolboxes)
        description_str = ['The following toolboxes are required and not installed: ' char(13)];

        for tlbx_ctr = 1:length(toolboxes)
            description_str = [description_str char(13) toolboxes{tlbx_ctr}]; %#ok<AGROW>
        end

        description_str = [description_str char(13) char(13) 'Without these toolboxes, the task will not function properly.  Please install.'];
    else 
        description_str = '';
    end
end
