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

end
