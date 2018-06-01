function cs = slrt_plant_configset()
%---------------------------------------------------------------------------
%  MATLAB function for configuration set generated on 20-Jun-2017 14:39:11
%  MATLAB version: 9.2.0.538062 (R2017a)
%  Copyright 2018 The MathWorks, Inc.
%---------------------------------------------------------------------------

cs = Simulink.ConfigSet;

% Original configuration set version: 1.17.0
if cs.versionCompare('1.17.0') < 0
    error('Simulink:MFileVersionViolation', 'The version of the target configuration set is older than the original configuration set.');
end

% Do not change the order of the following commands. There are dependencies between the parameters.
cs.set_param('Name', 'simulink_real_time'); % Name
cs.set_param('Description', ''); % Description

% Original configuration set target is slrt.tlc
try
    cs.switchTarget('slrt.tlc', '');
catch ME
    disp(ME.message);
    disp('Setting ''System target file'' to ''ert.tlc''.');
    cs.switchTarget('ert.tlc', '');
end

cs.set_param('HardwareBoard', 'None');   % Hardware board

% Solver
cs.set_param('StartTime', '0.0');   % Start time
cs.set_param('StopTime', 'inf');   % Stop time
cs.set_param('SolverType', 'Fixed-step');   % Type
cs.set_param('EnableConcurrentExecution', 'on');   % Show concurrent execution options
cs.set_param('ConcurrentTasks', 'off');   % Allow tasks to execute concurrently on target
cs.set_param('SampleTimeConstraint', 'Unconstrained');   % Periodic sample time constraint
cs.set_param('Solver', 'ode5');   % Solver
cs.set_param('FixedStep', '0.005');   % Fixed-step size (fundamental sample time)
cs.set_param('EnableMultiTasking', 'on');   % Treat each discrete rate as a separate task
cs.set_param('AutoInsertRateTranBlk', 'on');   % Automatically handle rate transition for data transfer
cs.set_param('InsertRTBMode', 'Whenever possible');   % Deterministic data transfer
cs.set_param('PositivePriorityOrder', 'off');   % Higher priority value indicates higher task priority

% Data Import/Export
cs.set_param('LoadExternalInput', 'off');   % Load external input
cs.set_param('LoadInitialState', 'off');   % Load initial state
cs.set_param('SaveTime', 'off');   % Save time
cs.set_param('SaveState', 'off');   % Save states
cs.set_param('SaveFormat', 'StructureWithTime');   % Format
cs.set_param('SaveOutput', 'off');   % Save output
cs.set_param('SaveFinalState', 'off');   % Save final state
cs.set_param('SignalLogging', 'on');   % Signal logging
cs.set_param('SignalLoggingName', 'logsout');   % Signal logging name
cs.set_param('DSMLogging', 'off');   % Data stores
cs.set_param('LoggingToFile', 'off');   % Log Dataset data to file
cs.set_param('DatasetSignalFormat', 'timeseries');   % DatasetSignalFormat
cs.set_param('ReturnWorkspaceOutputs', 'on');   % Single simulation output
cs.set_param('ReturnWorkspaceOutputsName', 'out');   % Simulation output variable
cs.set_param('LoggingIntervals', '[-inf, inf]');   % Logging intervals
cs.set_param('InspectSignalLogs', 'off');   % Record logged workspace data in Simulation Data Inspector
cs.set_param('LimitDataPoints', 'off');   % Limit data points
cs.set_param('Decimation', '1');   % Decimation

% Optimization
cs.set_param('BlockReduction', 'off');   % Block reduction
cs.set_param('ConditionallyExecuteInputs', 'on');   % Conditional input branch execution
cs.set_param('BooleanDataType', 'on');   % Implement logic signals as Boolean data (vs. double)
cs.set_param('LifeSpan', 'auto');   % Application lifespan (days)
cs.set_param('UseDivisionForNetSlopeComputation', 'off');   % Use division for fixed-point net slope computation
cs.set_param('UseFloatMulNetSlope', 'off');   % Use floating-point multiplication to handle net slope corrections
cs.set_param('DefaultUnderspecifiedDataType', 'single');   % Default for underspecified data type
cs.set_param('InitFltsAndDblsToZero', 'on');   % Use memset to initialize floats and doubles to 0.0
cs.set_param('EfficientFloat2IntCast', 'off');   % Remove code from floating-point to integer conversions that wraps out-of-range values
cs.set_param('EfficientMapNaN2IntZero', 'on');   % Remove code from floating-point to integer conversions with saturation that maps NaN to zero
cs.set_param('SimCompilerOptimization', 'off');   % Compiler optimization level
cs.set_param('AccelVerboseBuild', 'off');   % Verbose accelerator builds
cs.set_param('DefaultParameterBehavior', 'Tunable');   % Default parameter behavior
cs.set_param('OptimizeBlockIOStorage', 'off');   % Signal storage reuse
cs.set_param('EnableMemcpy', 'on');   % Use memcpy for vector assignment
cs.set_param('MemcpyThreshold', 64);   % Memcpy threshold (bytes)
cs.set_param('RollThreshold', 5);   % Loop unrolling threshold
cs.set_param('MaxStackSize', 'Inherit from target');   % Maximum stack size (bytes)
cs.set_param('StateBitsets', 'off');   % Use bitsets for storing state configuration
cs.set_param('DataBitsets', 'off');   % Use bitsets for storing Boolean data
cs.set_param('ActiveStateOutputEnumStorageType', 'Native Integer');   % Base storage type for automatically created enumerations
cs.set_param('AdvancedOptControl', '');   % AdvancedOptControl
cs.set_param('BufferReusableBoundary', 'on');   % BufferReusableBoundary

% Diagnostics
cs.set_param('AlgebraicLoopMsg', 'error');   % Algebraic loop
cs.set_param('ArtificialAlgebraicLoopMsg', 'warning');   % Minimize algebraic loop
cs.set_param('BlockPriorityViolationMsg', 'warning');   % Block priority violation
cs.set_param('MinStepSizeMsg', 'warning');   % Min step size violation
cs.set_param('TimeAdjustmentMsg', 'none');   % Sample hit time adjusting
cs.set_param('MaxConsecutiveZCsMsg', 'error');   % Consecutive zero crossings violation
cs.set_param('UnknownTsInhSupMsg', 'warning');   % Unspecified inheritability of sample time
cs.set_param('ConsistencyChecking', 'none');   % Solver data inconsistency
cs.set_param('SolverPrmCheckMsg', 'none');   % Automatic solver parameter selection
cs.set_param('ModelReferenceExtraNoncontSigs', 'error');   % Extraneous discrete derivative signals
cs.set_param('StateNameClashWarn', 'none');   % State name clash
cs.set_param('SimStateInterfaceChecksumMismatchMsg', 'warning');   % SimState interface checksum mismatch
cs.set_param('SimStateOlderReleaseMsg', 'error');   % SimState object from earlier release
cs.set_param('InheritedTsInSrcMsg', 'warning');   % Source block specifies -1 sample time
cs.set_param('MultiTaskRateTransMsg', 'error');   % Multitask rate transition
cs.set_param('SingleTaskRateTransMsg', 'none');   % Single task rate transition
% Fix for 
% The enabled subsystem 'PlantModel/Unmanned Airplane PlantModel/Weather Model/Dryden Wind Turbulence Model  (Discrete (+q -r))/Filters on velocities/Hugw(z)' executes in multiple tasks. This can cause corrupted data or non-deterministic behavior in a real-time system.
cs.set_param('MultiTaskCondExecSysMsg', 'warning');   % Multitask conditionally executed subsystem
cs.set_param('TasksWithSamePriorityMsg', 'warning');   % Tasks with equal priority
cs.set_param('SigSpecEnsureSampleTimeMsg', 'warning');   % Enforce sample times specified by Signal Specification blocks
cs.set_param('SignalResolutionControl', 'UseLocalSettings');   % Signal resolution
cs.set_param('CheckMatrixSingularityMsg', 'none');   % Division by singular matrix
cs.set_param('IntegerSaturationMsg', 'warning');   % Saturate on overflow
cs.set_param('UnderSpecifiedDataTypeMsg', 'none');   % Underspecified data types
cs.set_param('SignalRangeChecking', 'none');   % Simulation range checking
cs.set_param('IntegerOverflowMsg', 'warning');   % Wrap on overflow
cs.set_param('SignalInfNanChecking', 'none');   % Inf or NaN block output
cs.set_param('RTPrefix', 'error');   % "rt" prefix for identifiers
cs.set_param('ParameterDowncastMsg', 'error');   % Detect downcast
cs.set_param('ParameterOverflowMsg', 'error');   % Detect overflow
cs.set_param('ParameterUnderflowMsg', 'none');   % Detect underflow
cs.set_param('ParameterPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('ParameterTunabilityLossMsg', 'warning');   % Detect loss of tunability
cs.set_param('ReadBeforeWriteMsg', 'UseLocalSettings');   % Detect read before write
cs.set_param('WriteAfterReadMsg', 'UseLocalSettings');   % Detect write after read
cs.set_param('WriteAfterWriteMsg', 'UseLocalSettings');   % Detect write after write
cs.set_param('MultiTaskDSMMsg', 'error');   % Multitask data store
cs.set_param('UniqueDataStoreMsg', 'none');   % Duplicate data store names
cs.set_param('UnderspecifiedInitializationDetection', 'Simplified');   % Underspecified initialization detection
cs.set_param('ArrayBoundsChecking', 'none');   % Array bounds exceeded
cs.set_param('AssertControl', 'UseLocalSettings');   % Model Verification block enabling
cs.set_param('AllowSymbolicDim', 'on');   % Allow symbolic dimension specification
cs.set_param('UnnecessaryDatatypeConvMsg', 'none');   % Unnecessary type conversions
cs.set_param('VectorMatrixConversionMsg', 'none');   % Vector/matrix block input conversion
cs.set_param('Int32ToFloatConvMsg', 'warning');   % 32-bit integer to single precision float conversion
cs.set_param('FixptConstUnderflowMsg', 'none');   % Detect underflow
cs.set_param('FixptConstOverflowMsg', 'none');   % Detect overflow
cs.set_param('FixptConstPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('SignalLabelMismatchMsg', 'none');   % Signal label mismatch
cs.set_param('UnconnectedInputMsg', 'warning');   % Unconnected block input ports
cs.set_param('UnconnectedOutputMsg', 'warning');   % Unconnected block output ports
cs.set_param('UnconnectedLineMsg', 'warning');   % Unconnected line
cs.set_param('RootOutportRequireBusObject', 'warning');   % Unspecified bus object at root Outport block
cs.set_param('BusObjectLabelMismatch', 'warning');   % Element name mismatch
cs.set_param('StrictBusMsg', 'ErrorLevel1');   % Bus signal treated as vector
cs.set_param('NonBusSignalsTreatedAsBus', 'none');   % Non-bus signals treated as bus signals
cs.set_param('BusNameAdapt', 'WarnAndRepair');   % Repair bus selections
cs.set_param('InvalidFcnCallConnMsg', 'error');   % Invalid function-call connection
cs.set_param('FcnCallInpInsideContextMsg', 'error');   % Context-dependent inputs
cs.set_param('SFcnCompatibilityMsg', 'none');   % S-function upgrades needed
cs.set_param('FrameProcessingCompatibilityMsg', 'error');   % Block behavior depends on frame status of signal
cs.set_param('ModelReferenceVersionMismatchMessage', 'none');   % Model block version mismatch
cs.set_param('ModelReferenceIOMismatchMessage', 'none');   % Port and parameter mismatch
cs.set_param('ModelReferenceIOMsg', 'none');   % Invalid root Inport/Outport block connection
cs.set_param('ModelReferenceDataLoggingMessage', 'warning');   % Unsupported data logging
cs.set_param('SaveWithDisabledLinksMsg', 'warning');   % Block diagram contains disabled library links
cs.set_param('SaveWithParameterizedLinksMsg', 'warning');   % Block diagram contains parameterized library links
cs.set_param('SFUnusedDataAndEventsDiag', 'warning');   % Unused data, events, messages and functions
cs.set_param('SFUnexpectedBacktrackingDiag', 'warning');   % Unexpected backtracking
cs.set_param('SFInvalidInputDataAccessInChartInitDiag', 'warning');   % Invalid input data access in chart initialization
cs.set_param('SFNoUnconditionalDefaultTransitionDiag', 'warning');   % No unconditional default transitions
cs.set_param('SFTransitionOutsideNaturalParentDiag', 'warning');   % Transition outside natural parent
cs.set_param('SFUnreachableExecutionPathDiag', 'warning');   % Unreachable execution path
cs.set_param('SFUndirectedBroadcastEventsDiag', 'warning');   % Undirected event broadcasts
cs.set_param('SFTransitionActionBeforeConditionDiag', 'warning');   % Transition action specified before condition action
cs.set_param('SFOutputUsedAsStateInMooreChartDiag', 'error');   % Read-before-write to output in Moore chart
cs.set_param('SFTemporalDelaySmallerThanSampleTimeDiag', 'warning');   % Absolute time temporal value shorter than sampling period
cs.set_param('SFSelfTransitionDiag', 'warning');   % Self-transition on leaf state
cs.set_param('SFExecutionAtInitializationDiag', 'none');   % 'Execute-at-initialization' disabled in presence of input events
cs.set_param('SFMachineParentedDataDiag', 'warning');   % Use of machine-parented data instead of Data Store Memory
cs.set_param('IgnoredZcDiagnostic', 'warning');   % IgnoredZcDiagnostic
cs.set_param('InitInArrayFormatMsg', 'warning');   % InitInArrayFormatMsg
cs.set_param('MaskedZcDiagnostic', 'warning');   % MaskedZcDiagnostic
cs.set_param('ModelReferenceSymbolNameMessage', 'warning');   % ModelReferenceSymbolNameMessage
cs.set_param('AllowedUnitSystems', 'all');   % Allowed unit systems
cs.set_param('UnitsInconsistencyMsg', 'warning');   % Units inconsistency messages
cs.set_param('AllowAutomaticUnitConversions', 'on');   % Allow automatic unit conversions

% Hardware Implementation
cs.set_param('ProdHWDeviceType', 'Generic->32-bit x86 compatible');   % Production device vendor and type
% cs.set_param('ProdLongLongMode', 'on');   % Support long long in production hardware
% cs.set_param('ProdLargestAtomicInteger', 'Char');   % Production hardware largest atomic integer size
% cs.set_param('ProdLargestAtomicFloat', 'None');   % Production hardware largest atomic floating-point size
% cs.set_param('ProdEqTarget', 'on');   % Test hardware is the same as production hardware
% cs.set_param('TargetPreprocMaxBitsSint', 32);   % TargetPreprocMaxBitsSint
% cs.set_param('TargetPreprocMaxBitsUint', 32);   % TargetPreprocMaxBitsUint

% Model Referencing
cs.set_param('UpdateModelReferenceTargets', 'IfOutOfDateOrStructuralChange');   % Rebuild
cs.set_param('EnableParallelModelReferenceBuilds', 'off');   % Enable parallel model reference builds
cs.set_param('ModelReferenceNumInstancesAllowed', 'Single');   % Total number of instances allowed per top model
cs.set_param('PropagateVarSize', 'Infer from blocks in model');   % Propagate sizes of variable-size signals
cs.set_param('ModelReferenceMinAlgLoopOccurrences', 'off');   % Minimize algebraic loop occurrences
cs.set_param('EnableRefExpFcnMdlSchedulingChecks', 'on');   % Enable strict scheduling checks for referenced export-function models
cs.set_param('PropagateSignalLabelsOutOfModel', 'on');   % Propagate all signal labels out of the model
cs.set_param('ModelReferencePassRootInputsByReference', 'on');   % Pass fixed-size scalar root inputs by value for code generation
cs.set_param('ModelDependencies', '');   % Model dependencies
cs.set_param('ParallelModelReferenceErrorOnInvalidPool', 'on');   % ParallelModelReferenceErrorOnInvalidPool
cs.set_param('SupportModelReferenceSimTargetCustomCode', 'off');   % SupportModelReferenceSimTargetCustomCode

% Simulation Target
cs.set_param('MATLABDynamicMemAlloc', 'off');   % Dynamic memory allocation in MATLAB Function blocks
cs.set_param('CompileTimeRecursionLimit', 50);   % Compile-time recursion limit for MATLAB functions
cs.set_param('EnableRuntimeRecursion', 'on');   % Enable run-time recursion for MATLAB functions
cs.set_param('SFSimEcho', 'on');   % Echo expressions without semicolons
cs.set_param('SimCtrlC', 'on');   % Ensure responsiveness
cs.set_param('SimIntegrity', 'on');   % Ensure memory integrity
cs.set_param('SimGenImportedTypeDefs', 'on');   % Generate typedefs for imported bus and enumeration types
cs.set_param('SimBuildMode', 'sf_incremental_build');   % Simulation target build mode
cs.set_param('SimReservedNameArray', []);   % Reserved names
cs.set_param('SimParseCustomCode', 'on');   % Parse custom code symbols
cs.set_param('SimCustomSourceCode', '');   % Source file
cs.set_param('SimCustomHeaderCode', '');   % Header file
cs.set_param('SimCustomInitializer', '');   % Initialize function
cs.set_param('SimCustomTerminator', '');   % Terminate function
cs.set_param('SimUserIncludeDirs', '');   % Include directories
cs.set_param('SimUserSources', '');   % Source files
cs.set_param('SimUserLibraries', '');   % Libraries
cs.set_param('SimUserDefines', '');   % Defines
cs.set_param('SFSimEnableDebug', 'off');   % Allow setting breakpoints during simulation

% Code Generation
cs.set_param('TargetLang', 'C');   % Language
cs.set_param('CompOptLevelCompliant', 'on');   % CompOptLevelCompliant
cs.set_param('RTWCompilerOptimization', 'on');   % Compiler optimization level
cs.set_param('GenerateMakefile', 'on');   % Generate makefile
cs.set_param('TemplateMakefile', 'slrt_default_tmf');   % Template makefile
cs.set_param('ObjectivePriorities', []);   % Prioritized objectives
cs.set_param('CheckMdlBeforeBuild', 'Off');   % Check model before generating code
cs.set_param('GenCodeOnly', 'off');   % Generate code only
cs.set_param('PackageGeneratedCodeAndArtifacts', 'off');   % Package code and artifacts
cs.set_param('RTWVerbose', 'on');   % Verbose build
cs.set_param('RetainRTWFile', 'off');   % Retain .rtw file
cs.set_param('ProfileTLC', 'off');   % Profile TLC
cs.set_param('TLCDebug', 'off');   % Start TLC debugger when generating code
cs.set_param('TLCCoverage', 'off');   % Start TLC coverage when generating code
cs.set_param('TLCAssert', 'off');   % Enable TLC assertion
cs.set_param('RTWUseSimCustomCode', 'off');   % Use the same custom code settings as Simulation Target
cs.set_param('CustomSourceCode', '');   % Source file
cs.set_param('CustomHeaderCode', '');   % Header file
cs.set_param('CustomInclude', '../Autopilot/src');   % Include directories
cs.set_param('CustomSource', '');   % Source files
cs.set_param('CustomLibrary', '');   % Libraries
cs.set_param('CustomLAPACKCallback', '');   % Custom LAPACK library callback
cs.set_param('CustomDefine', '');   % Defines
cs.set_param('CustomInitializer', '');   % Initialize function
cs.set_param('CustomTerminator', '');   % Terminate function
cs.set_param('CodeProfilingInstrumentation', 'off');   % Measure function execution times
cs.set_param('MakeCommand', 'make_rtw');   % Make command
cs.set_param('PostCodeGenCommand', '');   % Post code generation command
cs.set_param('SaveLog', 'off');   % Save build log
cs.set_param('TLCOptions', '');   % TLC command line options
cs.set_param('GenerateReport', 'on');   % Create code generation report
cs.set_param('LaunchReport', 'on');   % Open report automatically
cs.set_param('GenerateComments', 'on');   % Include comments
cs.set_param('SimulinkBlockComments', 'on');   % Simulink block / Stateflow object comments
cs.set_param('MATLABSourceComments', 'on');   % MATLAB source code as comments
cs.set_param('ShowEliminatedStatement', 'on');   % Show eliminated blocks
cs.set_param('ForceParamTrailComments', 'on');   % Verbose comments for SimulinkGlobal storage class
cs.set_param('MaxIdLength', 31);   % Maximum identifier length
cs.set_param('UseSimReservedNames', 'off');   % Use the same reserved names as Simulation Target
cs.set_param('ReservedNameArray', []);   % Reserved names
cs.set_param('IncAutoGenComments', 'off');   % IncAutoGenComments
cs.set_param('IncDataTypeInIds', 'off');   % IncDataTypeInIds
cs.set_param('IncHierarchyInIds', 'off');   % IncHierarchyInIds
cs.set_param('PreserveName', 'off');   % PreserveName
cs.set_param('PreserveNameWithParent', 'off');   % PreserveNameWithParent
cs.set_param('TargetLangStandard', 'C89/C90 (ANSI)');   % Standard math library
cs.set_param('CodeReplacementLibrary', 'XPC_BLAS');   % Code replacement library
cs.set_param('UtilityFuncGeneration', 'Auto');   % Shared code placement
cs.set_param('GRTInterface', 'on');   % Classic call interface
cs.set_param('SupportNonFinite', 'on');   % Support non-finite numbers
cs.set_param('MultiwordLength', 2048);   % Maximum word length
cs.set_param('MatFileLogging', 'on');   % MAT-file logging
cs.set_param('LogVarNameModifier', 'rt_');   % MAT-file variable name modifier
cs.set_param('CPPClassGenCompliant', 'off');   % CPPClassGenCompliant
cs.set_param('ConcurrentExecutionCompliant', 'on');   % ConcurrentExecutionCompliant
cs.set_param('ERTFirstTimeCompliant', 'off');   % ERTFirstTimeCompliant
cs.set_param('GenerateFullHeader', 'on');   % GenerateFullHeader
cs.set_param('InferredTypesCompatibility', 'off');   % InferredTypesCompatibility
cs.set_param('ModelReferenceCompliant', 'on');   % ModelReferenceCompliant
cs.set_param('ParMdlRefBuildCompliant', 'on');   % ParMdlRefBuildCompliant
cs.set_param('TargetFcnLib', 'ansi_tfl_table_tmw.mat');   % TargetFcnLib
cs.set_param('TargetLibSuffix', '');   % TargetLibSuffix
cs.set_param('TargetPreCompLibLocation', '');   % TargetPreCompLibLocation
cs.set_param('UseToolchainInfoCompliant', 'off');   % UseToolchainInfoCompliant
cs.set_param('RL32LogTETModifier','on'); % Enables TET measurement on SLRT

% Simulink Coverage
cs.set_param('CovModelRefEnable', 'off');   % Record coverage for referenced models
cs.set_param('RecordCoverage', 'off');   % Record coverage for this model
cs.set_param('CovEnable', 'off');   % Enable coverage analysis
cs.set_param('CovEnableCumulative', 'on');   % Enable cumulative data collection
cs.set_param('CovSaveCumulativeToWorkspaceVar', 'on');   % Save cumulative coverage results in workspace variable
cs.set_param('CovCumulativeVarName', 'covCumulativeData');   % Cumulative coverage variable name
cs.set_param('CovSaveName', 'covdata');   % Last coverage run variable name
cs.set_param('CovNameIncrementing', 'off');   % Increment cvdata variable name with each simulation
cs.set_param('CovReportOnPause', 'on');   % Update coverage results on pause
cs.set_param('CovHTMLOptions', '');   % Coverage report options
cs.set_param('CovCumulativeReport', 'off');   % Include cumulative data in coverage report
cs.set_param('CovCompData', '');   % Additional data to include in coverage report
cs.set_param('CovFilter', '');   % Coverage filter filename
cs.set_param('CovSaveOutputData', 'on');   % Save output data