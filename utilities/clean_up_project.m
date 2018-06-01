function clean_up_project()
%clean_up_project   Clean up local customizations of the task
% 
%   Clean up the task for the current project. This function undoes
%   the settings applied in "set_up_project". It is set to Run at Shutdown.
%   Copyright 2018 The MathWorks, Inc.

% Close the task UI if one is open
taskselobj = findall(groot, 'Name', 'Task Selection');
for sel_ctr = 1:length(taskselobj)
    taskselobj(sel_ctr).delete;
end

% Reset the location where generated code and other temporary files are
% created (slprj) to the default:
Simulink.fileGenControl('reset');

% Close any open models
models_clean_up;

% Clear the workspace
% If not empty, Warn the user about clearing the worksapce

choice = questdlg('Clear the Base Workspace before closing the project?', ...
    'Clear Base Workspace', ...
    'Yes', 'No', 'Yes');

if strcmp(choice, 'Yes')
    evalin('base', 'clearvars;');
    evalin('base', 'clear mex;');
end

end
