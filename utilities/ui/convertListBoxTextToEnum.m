function selTask = convertListBoxTextToEnum(listBoxValue)
% This function converts the raw list box text into a "eTask" enumeration
%
%  Copyright 2018 The MathWorks, Inc.

switch listBoxValue
    case 'Flight Controller Design'
        selTask = eTask.FlightControllerDesign;
    case 'Test Flight Controller Under Different Conditions'
        selTask = eTask.TestFlightController;
    case 'Flight Envelope Characterization'
        selTask = eTask.FlightEnvelopeCharacterization;
    case 'UAV SME Capabilities Assessment'
        selTask = eTask.UAVSMECapabilities;
    case 'Test Correctness of the Autopilot’s Generated Code'
        selTask = eTask.TestAutopilotCodeOffline;
    case 'Deploy and Test Correctness of the Autopilot’s Generated Code'
        selTask = eTask.TestAutopilotCodeOnTarget;
    case 'System Integration Test'
        selTask = eTask.SystemIntegrationTest;
    case 'Run Regression Tests'
        selTask = eTask.RunRegressionTests;
    otherwise
        error(['Unsupported task ' listBoxValue ' in convertListBoxTextToEnum.m'])
end
