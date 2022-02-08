function runTestsuite(tags)

arguments
    tags {mustBeText} = '';
end

import matlab.unittest.TestRunner;
import matlab.unittest.TestSuite;
import matlab.unittest.Verbosity;
import matlab.unittest.plugins.XMLPlugin;
import matlab.unittest.plugins.TestReportPlugin;
import matlab.unittest.selectors.HasTag;

projObj = currentProject;

suite = TestSuite.fromProject(projObj);
if ~isempty(tags)
    suite = suite.selectIf(HasTag(tags));
end

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);
runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));
runner.addPlugin(TestReportPlugin.producingPDF('results.pdf'));
runner.addSimulinkTestResults();

results = runner.run(suite);

if ~ismember('github',tags)
    % GitHub actions evaluate test success from Test Report
    disp(results.assertSuccess);
end

end
