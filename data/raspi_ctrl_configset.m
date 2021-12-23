function cs = raspi_ctrl_configset()
% MATLAB function for configuration set generated on 21-May-2021 16:18:21
% MATLAB version: 9.10.0.1669831 (R2021a) Update 2

cs = Simulink.ConfigSet;

% Original configuration set version: 21.0.0
if cs.versionCompare('21.0.0') < 0
    error('Simulink:MFileVersionViolation', 'The version of the target configuration set is older than the original configuration set.');
end

% Character encoding: UTF-8

% Do not change the order of the following commands. There are dependencies between the parameters.
cs.set_param('Name', 'Configuration'); % Name
cs.set_param('Description', ''); % Description

% Original configuration set target is ert.tlc
cs.switchTarget('ert.tlc','');

cs.set_param('HardwareBoard', 'Raspberry Pi');   % Hardware board

cs.set_param('TargetLang', 'C');   % Language

cs.set_param('CodeInterfacePackaging', 'Nonreusable function');   % Code interface packaging

cs.set_param('GenerateAllocFcn', 'off');   % Use dynamic memory allocation for model initialization

cs.set_param('Solver', 'FixedStepAuto');   % Solver

% Solver
cs.set_param('StartTime', '0.0');   % Start time
cs.set_param('StopTime', 'inf');   % Stop time
cs.set_param('SampleTimeConstraint', 'Unconstrained');   % Periodic sample time constraint
cs.set_param('SolverType', 'Fixed-step');   % Type
cs.set_param('SolverName', 'FixedStepAuto');   % Solver
cs.set_param('FixedStep', 'auto');   % Fixed-step size (fundamental sample time)
cs.set_param('ConcurrentTasks', 'off');   % Allow tasks to execute concurrently on target
cs.set_param('EnableMultiTasking', 'on');   % Treat each discrete rate as a separate task
cs.set_param('PositivePriorityOrder', 'off');   % Higher priority value indicates higher task priority
cs.set_param('AutoInsertRateTranBlk', 'off');   % Automatically handle rate transition for data transfer

% Data Import/Export
cs.set_param('Decimation', '1');   % Decimation
cs.set_param('LoadExternalInput', 'off');   % Load external input
cs.set_param('SaveFinalState', 'off');   % Save final state
cs.set_param('LoadInitialState', 'off');   % Load initial state
cs.set_param('LimitDataPoints', 'off');   % Limit data points
cs.set_param('SaveFormat', 'Dataset');   % Format
cs.set_param('SaveOutput', 'off');   % Save output
cs.set_param('SaveState', 'off');   % Save states
cs.set_param('SignalLogging', 'on');   % Signal logging
cs.set_param('DSMLogging', 'off');   % Data stores
cs.set_param('InspectSignalLogs', 'off');   % Record logged workspace data in Simulation Data Inspector
cs.set_param('SaveTime', 'off');   % Save time
cs.set_param('ReturnWorkspaceOutputs', 'on');   % Single simulation output
% cs.set_param('TimeSaveName', 'tout');   % Time variable
% cs.set_param('OutputSaveName', 'yout');   % Output variable
cs.set_param('SignalLoggingName', 'logsout');   % Signal logging name
cs.set_param('DSMLoggingName', 'dsmout');   % Data stores logging name
cs.set_param('ReturnWorkspaceOutputsName', 'out');   % Simulation output variable
cs.set_param('LoggingToFile', 'off');   % Log Dataset data to file
cs.set_param('DatasetSignalFormat', 'timeseries');   % Dataset signal format
cs.set_param('LoggingIntervals', '[-inf, inf]');   % Logging intervals

% Optimization
cs.set_param('BlockReduction', 'on');   % Block reduction
cs.set_param('BooleanDataType', 'on');   % Implement logic signals as Boolean data (vs. double)
cs.set_param('ConditionallyExecuteInputs', 'on');   % Conditional input branch execution
cs.set_param('DefaultParameterBehavior', 'Inlined');   % Default parameter behavior
cs.set_param('UseDivisionForNetSlopeComputation', 'off');   % Use division for fixed-point net slope computation
cs.set_param('GainParamInheritBuiltInType', 'off');   % Gain parameters inherit a built-in integer type that is lossless
cs.set_param('UseFloatMulNetSlope', 'off');   % Use floating-point multiplication to handle net slope corrections
cs.set_param('InheritOutputTypeSmallerThanSingle', 'off');   % Inherit floating-point output type smaller than single precision
cs.set_param('DefaultUnderspecifiedDataType', 'double');   % Default for underspecified data type
cs.set_param('UseSpecifiedMinMax', 'off');   % Optimize using the specified minimum and maximum values
cs.set_param('OptimizationCustomize', 'off');   % Specify custom optimizations
cs.set_param('OptimizationPriority', 'Balanced');   % Priority
cs.set_param('OptimizationLevel', 'level2');   % Level
cs.set_param('DataBitsets', 'off');   % Use bitsets for storing Boolean data
cs.set_param('StateBitsets', 'off');   % Use bitsets for storing state configuration
cs.set_param('LocalBlockOutputs', 'on');   % Enable local block outputs
cs.set_param('EnableMemcpy', 'on');   % Use memcpy for vector assignment
cs.set_param('ExpressionFolding', 'on');   % Eliminate superfluous local variables (expression folding)
cs.set_param('BufferReuse', 'on');   % Reuse local block outputs
cs.set_param('OptimizeBlockIOStorage', 'on');   % Signal storage reuse
cs.set_param('AdvancedOptControl', '');   % Disable incompatible optimizations
cs.set_param('BitwiseOrLogicalOp', 'Same as modeled');   % Operator to represent Bitwise and Logical Operator blocks
cs.set_param('MemcpyThreshold', 64);   % Memcpy threshold (bytes)
cs.set_param('PassReuseOutputArgsAs', 'Individual arguments');   % Pass reusable subsystem outputs as
cs.set_param('PassReuseOutputArgsThreshold', 12);   % Maximum number of arguments for subsystem outputs
cs.set_param('RollThreshold', 5);   % Loop unrolling threshold
cs.set_param('ActiveStateOutputEnumStorageType', 'Native Integer');   % Base storage type for automatically created enumerations
cs.set_param('ZeroExternalMemoryAtStartup', 'off');   % Remove root level I/O zero initialization
cs.set_param('ZeroInternalMemoryAtStartup', 'off');   % Remove internal data zero initialization
cs.set_param('InitFltsAndDblsToZero', 'off');   % Use memset to initialize floats and doubles to 0.0
cs.set_param('NoFixptDivByZeroProtection', 'off');   % Remove code that protects against division arithmetic exceptions
cs.set_param('EfficientFloat2IntCast', 'off');   % Remove code from floating-point to integer conversions that wraps out-of-range values
cs.set_param('EfficientMapNaN2IntZero', 'on');   % Remove code from floating-point to integer conversions with saturation that maps NaN to zero
cs.set_param('LifeSpan', 'auto');   % Application lifespan (days)
cs.set_param('MaxStackSize', '64');   % Maximum stack size (bytes)
cs.set_param('BufferReusableBoundary', 'on');   % Buffer for reusable subsystems
cs.set_param('SimCompilerOptimization', 'off');   % Compiler optimization level
cs.set_param('AccelVerboseBuild', 'off');   % Verbose accelerator builds
cs.set_param('UseRowMajorAlgorithm', 'off');   % Use algorithms optimized for row-major array layout
cs.set_param('LabelGuidedReuse', 'off');   % Use signal labels to guide buffer reuse
cs.set_param('DenormalBehavior', 'GradualUnderflow');   % In accelerated simulation modes, denormal numbers can be flushed to zero using the 'flush-to-zero' option.
cs.set_param('EfficientTunableParamExpr', 'on');   % Remove code from tunable parameter expressions that saturates out-of-range values

% Diagnostics
cs.set_param('RTPrefix', 'error');   % "rt" prefix for identifiers
cs.set_param('ConsistencyChecking', 'none');   % Solver data inconsistency
cs.set_param('ArrayBoundsChecking', 'none');   % Array bounds exceeded
cs.set_param('SignalInfNanChecking', 'none');   % Inf or NaN block output
cs.set_param('StringTruncationChecking', 'error');   % String truncation checking
cs.set_param('SignalRangeChecking', 'none');   % Simulation range checking
cs.set_param('ReadBeforeWriteMsg', 'UseLocalSettings');   % Detect read before write
cs.set_param('WriteAfterWriteMsg', 'UseLocalSettings');   % Detect write after write
cs.set_param('WriteAfterReadMsg', 'UseLocalSettings');   % Detect write after read
cs.set_param('AlgebraicLoopMsg', 'warning');   % Algebraic loop
cs.set_param('ArtificialAlgebraicLoopMsg', 'warning');   % Minimize algebraic loop
cs.set_param('SaveWithDisabledLinksMsg', 'warning');   % Block diagram contains disabled library links
cs.set_param('SaveWithParameterizedLinksMsg', 'warning');   % Block diagram contains parameterized library links
cs.set_param('UnderspecifiedInitializationDetection', 'Simplified');   % Underspecified initialization detection
cs.set_param('CheckSSInitialOutputMsg', 'on');   % Check undefined subsystem initial output
cs.set_param('MergeDetectMultiDrivingBlocksExec', 'none');   % Detect multiple driving blocks executing at the same time step
cs.set_param('SignalResolutionControl', 'UseLocalSettings');   % Signal resolution
cs.set_param('BlockPriorityViolationMsg', 'warning');   % Block priority violation
cs.set_param('MinStepSizeMsg', 'warning');   % Min step size violation
cs.set_param('TimeAdjustmentMsg', 'none');   % Sample hit time adjusting
cs.set_param('MaxConsecutiveZCsMsg', 'error');   % Consecutive zero crossings violation
cs.set_param('MaskedZcDiagnostic', 'warning');   % Masked zero crossings
cs.set_param('IgnoredZcDiagnostic', 'warning');   % Ignored zero crossings
cs.set_param('SolverPrmCheckMsg', 'none');   % Automatic solver parameter selection
cs.set_param('InheritedTsInSrcMsg', 'warning');   % Source block specifies -1 sample time
cs.set_param('MultiTaskDSMMsg', 'error');   % Multitask data store
cs.set_param('MultiTaskCondExecSysMsg', 'error');   % Multitask conditionally executed subsystem
cs.set_param('MultiTaskRateTransMsg', 'error');   % Multitask data transfer
cs.set_param('SingleTaskRateTransMsg', 'none');   % Single task data transfer
cs.set_param('TasksWithSamePriorityMsg', 'warning');   % Tasks with equal priority
cs.set_param('SigSpecEnsureSampleTimeMsg', 'warning');   % Enforce sample times specified by Signal Specification blocks
cs.set_param('CheckMatrixSingularityMsg', 'none');   % Division by singular matrix
cs.set_param('IntegerOverflowMsg', 'warning');   % Wrap on overflow
cs.set_param('Int32ToFloatConvMsg', 'warning');   % 32-bit integer to single precision float conversion
cs.set_param('ParameterDowncastMsg', 'error');   % Detect downcast
cs.set_param('ParameterOverflowMsg', 'error');   % Detect overflow
cs.set_param('ParameterUnderflowMsg', 'none');   % Detect underflow
cs.set_param('ParameterPrecisionLossMsg', 'warning');   % Detect precision loss
cs.set_param('ParameterTunabilityLossMsg', 'error');   % Detect loss of tunability
cs.set_param('FixptConstUnderflowMsg', 'none');   % Detect underflow
cs.set_param('FixptConstOverflowMsg', 'none');   % Detect overflow
cs.set_param('FixptConstPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('UnderSpecifiedDataTypeMsg', 'none');   % Underspecified data types
cs.set_param('UnnecessaryDatatypeConvMsg', 'none');   % Unnecessary type conversions
cs.set_param('VectorMatrixConversionMsg', 'none');   % Vector/matrix block input conversion
cs.set_param('FcnCallInpInsideContextMsg', 'error');   % Context-dependent inputs
cs.set_param('SignalLabelMismatchMsg', 'none');   % Signal label mismatch
cs.set_param('UnconnectedInputMsg', 'warning');   % Unconnected block input ports
cs.set_param('UnconnectedOutputMsg', 'warning');   % Unconnected block output ports
cs.set_param('UnconnectedLineMsg', 'warning');   % Unconnected line
cs.set_param('SFcnCompatibilityMsg', 'none');   % S-function upgrades needed
cs.set_param('FrameProcessingCompatibilityMsg', 'error');   % Block behavior depends on frame status of signal
cs.set_param('UniqueDataStoreMsg', 'none');   % Duplicate data store names
cs.set_param('BusObjectLabelMismatch', 'warning');   % Element name mismatch
cs.set_param('RootOutportRequireBusObject', 'warning');   % Unspecified bus object at root Outport block
cs.set_param('AssertControl', 'UseLocalSettings');   % Model Verification block enabling
cs.set_param('AllowSymbolicDim', 'on');   % Allow symbolic dimension specification
cs.set_param('ModelReferenceIOMsg', 'none');   % Invalid root Inport/Outport block connection
cs.set_param('ModelReferenceVersionMismatchMessage', 'none');   % Model block version mismatch
cs.set_param('ModelReferenceIOMismatchMessage', 'none');   % Port and parameter mismatch
cs.set_param('UnknownTsInhSupMsg', 'warning');   % Unspecified inheritability of sample time
cs.set_param('ModelReferenceDataLoggingMessage', 'warning');   % Unsupported data logging
cs.set_param('ModelReferenceNoExplicitFinalValueMsg', 'none');   % No explicit final value for model arguments
cs.set_param('ModelReferenceSymbolNameMessage', 'warning');   % Insufficient maximum identifier length
cs.set_param('ModelReferenceExtraNoncontSigs', 'error');   % Extraneous discrete derivative signals
cs.set_param('StateNameClashWarn', 'none');   % State name clash
cs.set_param('OperatingPointInterfaceChecksumMismatchMsg', 'warning');   % Operating point restore interface checksum mismatch
cs.set_param('NonCurrentReleaseOperatingPointMsg', 'error');   % Operating point object from a different release
cs.set_param('PregeneratedLibrarySubsystemCodeDiagnostic', 'warning');   % Behavior when pregenerated library subsystem code is missing
cs.set_param('InitInArrayFormatMsg', 'warning');   % Initial state is array
cs.set_param('StrictBusMsg', 'ErrorLevel1');   % Bus signal treated as vector
cs.set_param('BusNameAdapt', 'WarnAndRepair');   % Repair bus selections
cs.set_param('NonBusSignalsTreatedAsBus', 'none');   % Non-bus signals treated as bus signals
cs.set_param('SFUnusedDataAndEventsDiag', 'warning');   % Unused data, events, messages and functions
cs.set_param('SFUnexpectedBacktrackingDiag', 'error');   % Unexpected backtracking
cs.set_param('SFInvalidInputDataAccessInChartInitDiag', 'warning');   % Invalid input data access in chart initialization
cs.set_param('SFNoUnconditionalDefaultTransitionDiag', 'error');   % No unconditional default transitions
cs.set_param('SFTransitionOutsideNaturalParentDiag', 'warning');   % Transition outside natural parent
cs.set_param('SFUnreachableExecutionPathDiag', 'warning');   % Unreachable execution path
cs.set_param('SFUndirectedBroadcastEventsDiag', 'warning');   % Undirected event broadcasts
cs.set_param('SFTransitionActionBeforeConditionDiag', 'warning');   % Transition action specified before condition action
cs.set_param('SFOutputUsedAsStateInMooreChartDiag', 'error');   % Read-before-write to output in Moore chart
cs.set_param('SFTemporalDelaySmallerThanSampleTimeDiag', 'warning');   % Absolute time temporal value shorter than sampling period
cs.set_param('SFSelfTransitionDiag', 'warning');   % Self-transition on leaf state
cs.set_param('SFExecutionAtInitializationDiag', 'warning');   % 'Execute-at-initialization' disabled in presence of input events
cs.set_param('SFMachineParentedDataDiag', 'error');   % Use of machine-parented data instead of Data Store Memory
cs.set_param('IntegerSaturationMsg', 'warning');   % Saturate on overflow
cs.set_param('AllowedUnitSystems', 'all');   % Allowed unit systems
cs.set_param('UnitsInconsistencyMsg', 'warning');   % Units inconsistency messages
cs.set_param('AllowAutomaticUnitConversions', 'on');   % Allow automatic unit conversions
cs.set_param('RCSCRenamedMsg', 'warning');   % Detect non-reused custom storage classes
cs.set_param('RCSCObservableMsg', 'warning');   % Detect ambiguous custom storage class final values
cs.set_param('ForceCombineOutputUpdateInSim', 'off');   % Combine output and update methods for code generation and simulation
cs.set_param('UnderSpecifiedDimensionMsg', 'none');   % Underspecified dimensions
cs.set_param('DebugExecutionForFMUViaOutOfProcess', 'off');   % FMU Import blocks
cs.set_param('ArithmeticOperatorsInVariantConditions', 'error');   % Arithmetic operations in variant conditions
cs.set_param('VariantConditionMismatch', 'none');   % Variant condition mismatch at signal source and destination

% Hardware Implementation
cs.set_param('ProdHWDeviceType', 'ARM Compatible->ARM Cortex');   % Production device vendor and type
cs.set_param('ProdLongLongMode', 'on');   % Support long long
cs.set_param('ProdIntDivRoundTo', 'Zero');   % Production hardware signed integer division rounds to
cs.set_param('ProdEndianess', 'LittleEndian');   % Byte ordering
cs.set_param('ProdShiftRightIntArith', 'on');   % Shift right on a signed integer as arithmetic shift
cs.set_param('ProdEqTarget', 'on');   % Test hardware is the same as production hardware
cs.set_param('TargetPreprocMaxBitsSint', 32);   % Maximum bits for signed integer in C preprocessor
cs.set_param('TargetPreprocMaxBitsUint', 32);   % Maximum bits for unsigned integer in C preprocessor
cs.set_param('UseEmbeddedCoderFeatures', 'on');   % Use Embedded Coder features
cs.set_param('HardwareBoardFeatureSet', 'EmbeddedCoderHSP');   % Feature set for selected hardware board

% Model Referencing
cs.set_param('UpdateModelReferenceTargets', 'IfOutOfDateOrStructuralChange');   % Rebuild
cs.set_param('EnableRefExpFcnMdlSchedulingChecks', 'on');   % Enable strict scheduling checks for referenced models
cs.set_param('EnableParallelModelReferenceBuilds', 'off');   % Enable parallel model reference builds
cs.set_param('ParallelModelReferenceErrorOnInvalidPool', 'on');   % Perform consistency check on parallel pool
cs.set_param('ModelReferenceNumInstancesAllowed', 'Multi');   % Total number of instances allowed per top model
cs.set_param('PropagateVarSize', 'Infer from blocks in model');   % Propagate sizes of variable-size signals
cs.set_param('ModelDependencies', '');   % Model dependencies
cs.set_param('ModelReferencePassRootInputsByReference', 'on');   % Pass fixed-size scalar root inputs by value for code generation
cs.set_param('ModelReferenceMinAlgLoopOccurrences', 'off');   % Minimize algebraic loop occurrences
cs.set_param('PropagateSignalLabelsOutOfModel', 'off');   % Propagate all signal labels out of the model
cs.set_param('SupportModelReferenceSimTargetCustomCode', 'off');   % Include custom code for referenced models

% Simulation Target
cs.set_param('SimCustomSourceCode', '');   % Source file
cs.set_param('SimCustomHeaderCode', '');   % Header file
cs.set_param('SimCustomInitializer', '');   % Initialize function
cs.set_param('SimCustomTerminator', '');   % Terminate function
cs.set_param('SimReservedNameArray', []);   % Reserved names
cs.set_param('SimUserSources', '');   % Source files
cs.set_param('SimUserIncludeDirs', '../src');   % Include directories
cs.set_param('SimUserLibraries', '');   % Libraries
cs.set_param('SimUserDefines', '');   % Defines
cs.set_param('SFSimEnableDebug', 'off');   % Allow setting breakpoints during simulation
cs.set_param('SFSimEcho', 'on');   % Echo expressions without semicolons
cs.set_param('SimCtrlC', 'on');   % Break on Ctrl-C
cs.set_param('SimIntegrity', 'on');   % Enable memory integrity checks
cs.set_param('SimParseCustomCode', 'on');   % Import custom code
cs.set_param('SimDebugExecutionForCustomCode', 'off');   % Simulate custom code in a separate process
cs.set_param('SimAnalyzeCustomCode', 'off');   % Enable custom code analysis
cs.set_param('SimGenImportedTypeDefs', 'off');   % Generate typedefs for imported bus and enumeration types
cs.set_param('CompileTimeRecursionLimit', 50);   % Compile-time recursion limit for MATLAB functions
cs.set_param('EnableRuntimeRecursion', 'on');   % Enable run-time recursion for MATLAB functions
cs.set_param('MATLABDynamicMemAlloc', 'on');   % Dynamic memory allocation in MATLAB functions
cs.set_param('MATLABDynamicMemAllocThreshold', 65536);   % Dynamic memory allocation threshold in MATLAB functions
cs.set_param('LegacyBehaviorForPersistentVarInContinuousTime', 'off');   % Enable continuous-time MATLAB functions to write to initialized persistent variables
cs.set_param('CustomCodeFunctionArrayLayout', []);   % Exception by function...
cs.set_param('DefaultCustomCodeFunctionArrayLayout', 'NotSpecified');   % Default function array layout
cs.set_param('CustomCodeUndefinedFunction', 'FilterOut');   % Undefined function handling
cs.set_param('CustomCodeGlobalsAsFunctionIO', 'off');   % Enable global variables as function interfaces
cs.set_param('DefaultCustomCodeDeterministicFunctions', 'None');   % Deterministic functions
cs.set_param('SimHardwareAcceleration', 'generic');   % Hardware acceleration
cs.set_param('GPUAcceleration', 'off');   % GPU acceleration
cs.set_param('SimTargetLang', 'C');   % Language

% Code Generation
cs.set_param('RemoveResetFunc', 'on');   % Remove reset function
cs.set_param('ExistingSharedCode', '');   % Existing shared code
cs.set_param('TLCOptions', '-aInlineSetEventsForThisBaseRateFcn=TLC_FALSE -aSuppressMultiTaskScheduler=TLC_FALSE  -aRateBasedStepFcn=0');   % TLC command line options
cs.set_param('GenCodeOnly', 'off');   % Generate code only
cs.set_param('PackageGeneratedCodeAndArtifacts', 'off');   % Package code and artifacts
cs.set_param('PostCodeGenCommand', 'codertarget.postCodeGenHookCommand(h)');   % Post code generation command
cs.set_param('GenerateReport', 'on');   % Create code generation report
cs.set_param('RTWVerbose', 'on');   % Verbose build
cs.set_param('RetainRTWFile', 'off');   % Retain .rtw file
cs.set_param('ProfileTLC', 'off');   % Profile TLC
cs.set_param('TLCDebug', 'off');   % Start TLC debugger when generating code
cs.set_param('TLCCoverage', 'off');   % Start TLC coverage when generating code
cs.set_param('TLCAssert', 'off');   % Enable TLC assertion
cs.set_param('RTWUseSimCustomCode', 'on');   % Use the same custom code settings as Simulation Target
cs.set_param('CustomBLASCallback', '');   % Custom BLAS library callback
cs.set_param('CustomLAPACKCallback', '');   % Custom LAPACK library callback
cs.set_param('CustomFFTCallback', '');   % Custom FFT library callback
cs.set_param('Toolchain', 'GNU GCC Embedded Linux');   % Toolchain
cs.set_param('BuildConfiguration', 'Faster Runs');   % Build configuration
cs.set_param('PortableWordSizes', 'on');   % Enable portable word sizes
cs.set_param('CreateSILPILBlock', 'None');   % Create block
cs.set_param('CodeExecutionProfiling', 'off');   % Measure task execution time
cs.set_param('CodeProfilingInstrumentation', 'off');   % Measure function execution times
cs.set_param('CodeCoverageSettings', coder.coverage.CodeCoverageSettings([],'off','off','None'));   % Third-party tool
cs.set_param('SILDebugging', 'off');   % Enable source-level debugging for SIL
cs.set_param('GenerateCodeMetricsReport', 'off');   % Generate static code metrics
cs.set_param('ObjectivePriorities', []);   % Prioritized objectives
cs.set_param('CheckMdlBeforeBuild', 'Off');   % Check model before generating code
cs.set_param('GenerateComments', 'on');   % Include comments
cs.set_param('ForceParamTrailComments', 'on');   % Verbose comments for 'Model default' storage class
cs.set_param('CommentStyle', 'Auto');   % Comment style
cs.set_param('IgnoreCustomStorageClasses', 'off');   % Ignore custom storage classes
cs.set_param('IgnoreTestpoints', 'off');   % Ignore test point signals
cs.set_param('MaxIdLength', 62);   % Maximum identifier length
cs.set_param('ShowEliminatedStatement', 'on');   % Show eliminated blocks
cs.set_param('OperatorAnnotations', 'on');   % Operator annotations
cs.set_param('SimulinkDataObjDesc', 'on');   % Simulink data object descriptions
cs.set_param('SFDataObjDesc', 'on');   % Stateflow object descriptions
cs.set_param('MATLABFcnDesc', 'off');   % MATLAB user comments
cs.set_param('MangleLength', 1);   % Minimum mangle length
cs.set_param('SharedChecksumLength', 8);   % Shared checksum length
cs.set_param('CustomSymbolStrGlobalVar', '$R$N$M');   % Global variables
cs.set_param('CustomSymbolStrType', '$N$R$M_T');   % Global types
cs.set_param('CustomSymbolStrField', '$N$M');   % Field name of global types
cs.set_param('CustomSymbolStrFcn', '$R$N$M$F');   % Subsystem methods
cs.set_param('CustomSymbolStrFcnArg', 'rt$I$N$M');   % Subsystem method arguments
cs.set_param('CustomSymbolStrBlkIO', 'rtb_$N$M');   % Local block output variables
cs.set_param('CustomSymbolStrTmpVar', '$N$M');   % Local temporary variables
cs.set_param('CustomSymbolStrMacro', '$R$N$M');   % Constant macros
cs.set_param('CustomSymbolStrEmxType', 'emxArray_$M$N');   % EMX array types identifier format
cs.set_param('CustomSymbolStrEmxFcn', 'emx$M$N');   % EMX array utility functions identifier format
cs.set_param('CustomUserTokenString', '');   % Custom token text
cs.set_param('EnableCustomComments', 'off');   % Custom comments (MPT objects only)
cs.set_param('DefineNamingRule', 'None');   % #define naming
cs.set_param('ParamNamingRule', 'None');   % Parameter naming
cs.set_param('SignalNamingRule', 'None');   % Signal naming
cs.set_param('InsertBlockDesc', 'on');   % Simulink block descriptions
cs.set_param('InsertPolySpaceComments', 'off');   % Insert Polyspace comments
cs.set_param('SimulinkBlockComments', 'on');   % Simulink block comments
cs.set_param('StateflowObjectComments', 'off');   % Stateflow object comments
cs.set_param('BlockCommentType', 'BlockPathComment');   % Trace to model using
cs.set_param('MATLABSourceComments', 'off');   % MATLAB source code as comments
cs.set_param('InternalIdentifier', 'Shortened');   % System-generated identifiers
cs.set_param('InlinedPrmAccess', 'Literals');   % Generate scalar inlined parameters as
cs.set_param('ReqsInCode', 'off');   % Requirements in block comments
cs.set_param('UseSimReservedNames', 'off');   % Use the same reserved names as Simulation Target
cs.set_param('ReservedNameArray', []);   % Reserved names
cs.set_param('EnumMemberNameClash', 'error');   % Duplicate enumeration member names
cs.set_param('TargetLibSuffix', '');   % Suffix applied to target library name
cs.set_param('TargetPreCompLibLocation', '');   % Precompiled library location
cs.set_param('TargetLangStandard', 'C99 (ISO)');   % Standard math library
cs.set_param('CodeReplacementLibrary', 'None');   % Code replacement library
cs.set_param('UtilityFuncGeneration', 'Auto');   % Shared code placement
cs.set_param('MultiwordTypeDef', 'System defined');   % Multiword type definitions
cs.set_param('DynamicStringBufferSize', 256);   % Buffer size of dynamically-sized string (bytes)
cs.set_param('GenerateFullHeader', 'on');   % Generate full file banner
cs.set_param('InferredTypesCompatibility', 'off');   % Create preprocessor directive in rtwtypes.h
cs.set_param('GenerateSampleERTMain', 'off');   % Generate an example main program
cs.set_param('IncludeMdlTerminateFcn', 'on');   % Terminate function required
cs.set_param('GRTInterface', 'off');   % Classic call interface
cs.set_param('CombineOutputUpdateFcns', 'on');   % Single output/update function
cs.set_param('CombineSignalStateStructs', 'off');   % Combine signal/state structures
cs.set_param('MatFileLogging', 'off');   % MAT-file logging
cs.set_param('SuppressErrorStatus', 'off');   % Remove error status field in real-time model data structure
cs.set_param('IncludeFileDelimiter', 'Auto');   % #include file delimiter
cs.set_param('ERTCustomFileBanners', 'on');   % Enable custom file banner
cs.set_param('SupportAbsoluteTime', 'on');   % Support absolute time
cs.set_param('PurelyIntegerCode', 'off');   % Support floating-point numbers
cs.set_param('SupportNonFinite', 'on');   % Support non-finite numbers
cs.set_param('SupportComplex', 'on');   % Support complex numbers
cs.set_param('SupportContinuousTime', 'off');   % Support continuous time
cs.set_param('SupportNonInlinedSFcns', 'off');   % Support non-inlined S-functions
cs.set_param('RemoveDisableFunc', 'off');   % Remove disable function
cs.set_param('SupportVariableSizeSignals', 'on');   % Support variable-size signals
cs.set_param('ParenthesesLevel', 'Nominal');   % Parentheses level
cs.set_param('CastingMode', 'Nominal');   % Casting modes
cs.set_param('ArrayLayout', 'Column-major');   % Array layout
cs.set_param('LUTObjectStructOrderExplicitValues', 'Size,Breakpoints,Table');   % LUT object struct order for explicit value specification
cs.set_param('LUTObjectStructOrderEvenSpacing', 'Size,Breakpoints,Table');   % LUT object struct order for even spacing specification
cs.set_param('ERTHeaderFileRootName', '$R$E');   % Header files
cs.set_param('ERTSourceFileRootName', '$R$E');   % Source files
cs.set_param('ERTFilePackagingFormat', 'Modular');   % File packaging format
cs.set_param('ERTDataFileRootName', '$R_data');   % Data files
cs.set_param('GlobalDataDefinition', 'Auto');   % Data definition
cs.set_param('GlobalDataReference', 'Auto');   % Data declaration
cs.set_param('ExtModeMexFile', 'ext_xcp');   % MEX-file name
cs.set_param('EnableUserReplacementTypes', 'off');   % Replace data type names in the generated code
cs.set_param('ConvertIfToSwitch', 'on');   % Convert if-elseif-else patterns to switch-case statements
cs.set_param('ERTCustomFileTemplate', 'codertarget_file_process.tlc');   % File customization template
cs.set_param('ERTDataHdrFileTemplate', 'ert_code_template.cgt');   % Header file template
cs.set_param('ERTDataSrcFileTemplate', 'ert_code_template.cgt');   % Source file template
cs.set_param('RateTransitionBlockCode', 'Inline');   % Rate Transition block code
cs.set_param('ERTHdrFileBannerTemplate', 'ert_code_template.cgt');   % Header file template
cs.set_param('ERTSrcFileBannerTemplate', 'ert_code_template.cgt');   % Source file template
cs.set_param('EnableDataOwnership', 'off');   % Use owner from data object for data definition placement
cs.set_param('IndentSize', '2');   % Indent size
cs.set_param('IndentStyle', 'K&R');   % Indent style
cs.set_param('NewlineStyle', 'Default');   % Newline style
cs.set_param('MaxLineWidth', 80);   % Maximum line width
cs.set_param('ParamTuneLevel', 10);   % Parameter tune level
cs.set_param('EnableSignedLeftShifts', 'on');   % Replace multiplications by powers of two with signed bitwise shifts
cs.set_param('EnableSignedRightShifts', 'on');   % Allow right shifts on signed integers
cs.set_param('PreserveExpressionOrder', 'off');   % Preserve operand order in expression
cs.set_param('PreserveExternInFcnDecls', 'on');   % Preserve extern keyword in function declarations
cs.set_param('PreserveIfCondition', 'off');   % Preserve condition expression in if statement
cs.set_param('RTWCAPIParams', 'off');   % Generate C API for parameters
cs.set_param('RTWCAPIRootIO', 'off');   % Generate C API for root-level I/O
cs.set_param('RTWCAPISignals', 'off');   % Generate C API for signals
cs.set_param('RTWCAPIStates', 'off');   % Generate C API for states
cs.set_param('SignalDisplayLevel', 10);   % Signal display level
cs.set_param('SuppressUnreachableDefaultCases', 'on');   % Suppress generation of default cases for Stateflow switch statements if unreachable
cs.set_param('BooleanTrueId', 'true');   % Boolean true identifier
cs.set_param('BooleanFalseId', 'false');   % Boolean false identifier
cs.set_param('MaxIdInt32', 'MAX_int32_T');   % 32-bit integer maximum identifier
cs.set_param('MinIdInt32', 'MIN_int32_T');   % 32-bit integer minimum identifier
cs.set_param('MaxIdUint32', 'MAX_uint32_T');   % 32-bit unsigned integer maximum identifier
cs.set_param('MaxIdInt16', 'MAX_int16_T');   % 16-bit integer maximum identifier
cs.set_param('MinIdInt16', 'MIN_int16_T');   % 16-bit integer minimum identifier
cs.set_param('MaxIdUint16', 'MAX_uint16_T');   % 16-bit unsigned integer maximum identifier
cs.set_param('MaxIdInt8', 'MAX_int8_T');   % 8-bit integer maximum identifier
cs.set_param('MinIdInt8', 'MIN_int8_T');   % 8-bit integer minimum identifier
cs.set_param('MaxIdUint8', 'MAX_uint8_T');   % 8-bit unsigned integer maximum identifier
cs.set_param('MaxIdInt64', 'MAX_int64_T');   % 64-bit integer maximum identifier
cs.set_param('MinIdInt64', 'MIN_int64_T');   % 64-bit integer minimum identifier
cs.set_param('MaxIdUint64', 'MAX_uint64_T');   % 64-bit unsigned integer maximum identifier
cs.set_param('TypeLimitIdReplacementHeaderFile', '');   % Type limit identifier replacement header file
cs.set_param('DSAsUniqueAccess', 'off');   % Implement each data store block as a unique access point

% Simulink Coverage
cs.set_param('CovModelRefEnable', 'off');   % Record coverage for referenced models
cs.set_param('RecordCoverage', 'off');   % Record coverage for this model
cs.set_param('CovEnable', 'off');   % Enable coverage analysis

% Coder Target
try
  cs_componentCC = CoderTarget.SettingsController;
  cs.attachComponent(cs_componentCC);
  cs.set_param('CoderTargetData', struct('UseCoderTarget',true,'TargetHardware','Raspberry Pi','ConnectionInfo',struct('XCPonTCPIP',struct('IPAddress','codertarget.raspi.getDeviceAddress','Port','17725','Verbose',false,'RunInBackground',false),'TCPIP',struct('IPAddress','codertarget.raspi.getDeviceAddress','Port','17725','Verbose',false,'RunInBackground',false)),'ExtMode',struct('Configuration','XCP on TCP/IP','signalBufferSize',1000000),'RTOS','Linux','RTOSBaseRateTaskPriority','40','DetectTaskOverruns',0,'Scheduler_interrupt_source',0,'BoardParameters',struct('DeviceAddress','10.10.10.16','Username','pi','Password','raspberry','BuildDir','/home/pi'),'Runtime',struct('BuildAction','Build and run','RunOnBoot',false),'SPI',struct('SPI0CE0BusSpeed','500','SPI0CE1BusSpeed','500'),'CAN',struct('CANBusSpeed','500','CANOscillatorFrequency','16','InterruptPin','12','AllowAllFilter',1,'Buffer0IDType','Normal','AcceptanceMask0','0','AcceptanceFilter0','255','AcceptanceFilter1','255','Buffer1IDType','Normal','AcceptanceMask1','0','AcceptanceFilter2','255','AcceptanceFilter3','255','AcceptanceFilter4','255','AcceptanceFilter5','255'),'MQTT',struct('BrokerAddress','mqtt.thingspeak.com','Username','','Password','','ClientID',''),'SimulinkIO',struct('Enable_SimulinkIO',1,'TransportLayerType','TCP/IP','ModelTransportDataFcn','codertarget.raspi.ioclient.getModelTransportInfo','ServerDeployFcn','codertarget.raspi.ioclient.deployServer'),'Modbus',struct('Modbus_comms','TCP/IP','Modbus_mode','Master','Modbus_serverRemotePort','502','Modbus_serverLocalPort','502','Modbus_configCoil','1','Modbus_CoilAddr','0','Modbus_CoilNum','1','Modbus_configInput','1','Modbus_InputAddr','0','Modbus_InputNum','1','Modbus_configHoldingReg','1','Modbus_HoldingRegAddr','0','Modbus_HoldingRegNum','1','Modbus_configInputReg','1','Modbus_InputRegAddr','0','Modbus_InputRegNum','1','Modbus_MasterTimeout','100'),'DataVersion','2016.02'));   % CoderTargetData
catch ME
  warning('Simulink:ConfigSet:AttachComponentError', '%s', ME.message);
end