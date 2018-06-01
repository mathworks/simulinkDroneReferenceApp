function renameLibLinks(mdl,origLibBlockName,newLibBlockName)
% RENAMELIBLINKS(model, orignalLibraryBlockName, newLibraryBlockName)
% This function will parse through the model for all blocks which are
% linked to originalLibraryBlockName and replace their link with
% newLibraryBLockName
%
% eg. >> renameLibLinks(gcs,'Control/PID Controller','Coordinates/LLA to Flat Earth with Init Pos')
%
%  Copyright 2018 The MathWorks, Inc.

    %% Load Model
    system = load_system(mdl);
    origRefBlock = [origLibBlockName,'.*'];
    newRefBlock = newLibBlockName;
    blocks = find_system(system,'FollowLinks','on',...
                            'LookUnderMasks','on',...
                            'RegExp','on',...
                            'LinkStatus','resolved',...
                            'ReferenceBlock',origRefBlock);
    % Unlock Lib Link
    set_param(mdl, 'LockLinksToLibrary', 'off')
    %% Find lib and rename
    for i=1:numel(blocks)
        set_param(blocks(i),'ReferenceBlock',newRefBlock);
    end
end