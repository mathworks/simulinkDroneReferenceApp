function runTestsuite

import matlab.unittest.TestRunner;
import matlab.unittest.TestSuite;
import matlab.unittest.Verbosity;
import matlab.unittest.plugins.XMLPlugin;
import matlab.unittest.plugins.TestReportPlugin;

projObj = currentProject;

suite = TestSuite.fromProject(projObj);

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);
runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));
runner.addPlugin(TestReportPlugin.producingPDF('results.pdf'));
runner.addSimulinkTestResults();

results = runner.run(suite);

disp(results.assertSuccess);

end
