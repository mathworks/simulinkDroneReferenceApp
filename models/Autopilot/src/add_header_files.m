function add_header_files(h)
disp('Add extra files for transfer to Raspberry Pi in add_source_files.m called via PostCodeGenCommand...')
buildInfo = h.BuildInfo;
project = simulinkproject;
projectRoot = project.RootFolder;
mavlinkDir = fullfile(projectRoot,'models','Autopilot','src');

addIncludeFiles(buildInfo,'*.h',fullfile(mavlinkDir, 'mavlink', 'missionlib'));
addIncludeFiles(buildInfo, fullfile(mavlinkDir, 'mavlinkSend.h'));
addIncludeFiles(buildInfo,'*.h', fullfile(mavlinkDir,'messages'));
addIncludeFiles(buildInfo,'*.h', fullfile(mavlinkDir,'messages', 'common'));
disp('...Files added')

codertarget.postCodeGenHookCommand(h)
end