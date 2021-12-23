function simout = runShortFlight(model, simTime)
% Script shortcut to run a short flight in an L pattern
%
%  Copyright 2018 The MathWorks, Inc.

arguments
    model (1,:) char = bdroot();
    simTime (1,1) {mustBeNonnegative} = 425;
end

%% Sim the model
simout = sim(model,'StopTime',num2str(simTime),'ReturnWorkspaceOutputs','on'); 

%% Plot the flight results
PlotFlightResults(simout);

end