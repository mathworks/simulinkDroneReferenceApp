function [tlbox_not_installed, spkg_not_installed, no_license] = taskToolboxStatus(sel_task)
% This function determines the licensing and installation status for all
% required toolboxes and support packages.
%
% Copyright 2018 The MathWorks, Inc.
no_license = {};

% These are the toolboxes needed to run ALL of the models
base_tlbxs = { ...
    'Simulink' ...
    'Stateflow' ...
    'Control System Toolbox' ... % "zpk" is used in the controller model
    'Aerospace Blockset' ...
    };
    
base_spkgs = {};

switch sel_task
    case eTask.FlightControllerDesign
        extra_tlbxs = {};
        extra_spkgs = {};
    case eTask.UAVSMECapabilities
        extra_tlbxs = {};
        extra_spkgs = {};
    case eTask.SystemIntegrationTest
        extra_tlbxs = { ...
            'Simulink Coder' ...
            'Embedded Coder' ...
            'MATLAB Coder' ... % Required by Simulink Real-Time
            'Simulink Real-Time' ...
            };
        %This is the master list of required support packages
        extra_spkgs = { ...
            'Simulink Support Package for Raspberry Pi Hardware' ...
            };
        
    case eTask.TestAutopilotCodeOffline
        extra_tlbxs = { ...
            'Simulink Coder' ...
            'Embedded Coder' ...
            };
        extra_spkgs = { ...
            'Simulink Support Package for Raspberry Pi Hardware' ...
            };
        
    case eTask.TestAutopilotCodeOnTarget
        extra_tlbxs = { ...
            'Simulink Coder' ...
            'Embedded Coder' ...
            };
        
        extra_spkgs = { ...
            'Simulink Support Package for Raspberry Pi Hardware' ...
            };

    case eTask.TestFlightController
        extra_tlbxs = { ...
            'Parallel Computing Toolbox' ...
            };
        extra_spkgs = {};
        
    case eTask.FlightEnvelopeCharacterization
        extra_tlbxs = { ...
            'Parallel Computing Toolbox' ...
            };
        extra_spkgs = {};
        
    case eTask.RunRegressionTests
        extra_tlbxs = { ...
            'Simulink Test' ...
            };
        extra_spkgs = {};
        
    otherwise
        error('Unsupported task in taskToolboxStatus.m')
end

all_installed_tlbxs = ver;
all_installed_tlbx_names = {all_installed_tlbxs.Name};

% Fuse the base and the "extra" together
all_tlbxs = [base_tlbxs extra_tlbxs];

tlbox_not_installed = {};
for tlbx_ctr = 1:length(all_tlbxs)
    tlbx = all_tlbxs{tlbx_ctr};
    
    if ~any(strcmp(tlbx, all_installed_tlbx_names))
        %fail to find a required toolbox
        tlbox_not_installed{end+1} = tlbx; %#ok<AGROW>
    else
        % Verify that the product has a license
        productidentifier = com.mathworks.product.util.ProductIdentifier.get(tlbx);
        feature = char(productidentifier.getFlexName());
        
        if ~license('checkout',feature)
            % if made it here, the license isn't available
            no_license{end+1} = tlbx; %#ok<AGROW>
        end
        
    end
end

all_spkgs = [base_spkgs extra_spkgs];

all_installed_spkgs = matlabshared.supportpkg.getInstalled;
if ~isempty(all_installed_spkgs)
    all_installed_spkgs_names = {all_installed_spkgs.Name};
else
    all_installed_spkgs_names = {};
end

spkg_not_installed = {};
for spkg_ctr = 1:length(all_spkgs)
    spkg = all_spkgs{spkg_ctr};
    
    if ~any(strcmp(spkg, all_installed_spkgs_names))
        %fail to find a required support package
        spkg_not_installed{end+1} = spkg; %#ok<AGROW>
    end
end
