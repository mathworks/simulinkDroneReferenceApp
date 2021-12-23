function set_up_project()
    %set_up_project:  Configure the task for this project
    %
    %   Set up the task for the current project. This function is set to
    %   Run at Startup.
    %  Copyright 2018 The MathWorks, Inc.
    
    %% Adding logic for initializing git submodule
    
    % Use Simulink Project API to get the current project:
    project = currentProject;
    % Set the location of slprj to be the "work" folder of the current project:
    projectRoot = project.RootFolder;
    
    % Initialize submodules directly
    submodulesList = {fullfile(projectRoot,'models','Autopilot','src','mavlink','missionlib')};
    for i = 1:length(submodulesList)
        if ~isfolder(submodulesList{i})
            if ~batchStartupOptionUsed
                choice_sub = questdlg('It looks like you do not have the submodule correctly initialized. Do you wish to set it up ? This will run !git submodule update --init', ...
                    'Git submodule missing', ...
                    'Yes','No', 'Yes');
                if strcmp(choice_sub, 'Yes')
                    try
                        !git submodule update --init
                    catch ME
                        errordlg('Unable to setup git submodule', ...
                            'Git submodule setup Failed');
                        rethrow(ME);
                    end
                end
            else
                error('Submodule ''%s'' is not initialized.',submodulesList{i});
            end
        else
            fprintf('Submodule ''%s'' was found.\n',submodulesList{i});
        end
    end
    
    end