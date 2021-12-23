classdef eTask < uint32
% This enumeration defines all of the tasks that a user can select.
%
% Copyright 2018 The MathWorks, Inc.   
   enumeration
      FlightControllerDesign          (0)
      TestFlightController            (1)
      FlightEnvelopeCharacterization  (2)
      UAVSMECapabilities              (3)
      TestAutopilotCodeOffline        (4)
      TestAutopilotCodeOnTarget       (5)
      SystemIntegrationTest           (6)
      RunRegressionTests              (7)
   end
end