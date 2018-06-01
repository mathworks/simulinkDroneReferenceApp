function simout = legacy_runparsim()
% simout = leagacy_runparsim()  Run parallel simulations for One-Click Run-All (OCRA)
% 
%   Legacy run parallel simulations using the PCT locally (using the cores).
%   Using spmd and parfor is no longer recommended.
%   Run with runparsim instead
%
%   Copyright 2018 The MathWorks, Inc.

% 1A) Load model and initialize the pool.
model = 'simModel';
load_system(model);
poolobj = parpool;

% 1B) Attach dependencies to the pool
% files = dependencies.fileDependencyAnalysis(model);
% poolobj.addAttachedFiles(files);

% 2) Set up the iterations that we want to compute.
iterations          = 4;
simout(iterations)  = Simulink.SimulationOutput;

% 3) Need to switch all workers to a separate tempdir in case 
% any code is generated for instance for StateFlow, or any other 
% file artifacts are  created by the model.
spmd
    % Setup tempdir and cd into it
    currDir = pwd;
    addpath(currDir);
    tmpDir = tempname;
    mkdir(tmpDir);
    cd(tmpDir);
       
    % Setup all the workspace variables
    % Set the plant and controller to sim configuration by default.

    assignin('base','plantConfigSet', sim_plant_configset);
%     assignin('base','plantConfigSet', slrt_plant_configset);
    assignin('base','ctrlConfigSet', ctrl_configset);
    % initialize the workspace
    evalin('base','dd');
    
     % Load the model on the worker
    load_system(model);
end

% 4) Loop over the number of iterations and perform the
% computation for different parameter values.
parfor idx=1:iterations   
    % Do any variations here;
    simout(idx) = sim(model, 'SimulationMode', 'normal');
end

% 5) Switch all of the workers back to their original folder.
spmd
    cd(currDir);
    evalin('base', 'clear mex')
    rmdir(tmpDir,'s');
    rmpath(currDir);
    close_system(model, 0);
end

close_system(model, 0);
delete(gcp('nocreate'));
delete(poolobj);
end
