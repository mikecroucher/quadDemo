function plan = buildfile
    plan = buildplan(localfunctions);
    plan("test").Dependencies = "check";
    plan("package").Dependencies = "test";
end

function checkTask(~)
    issues = codeIssues(["solveQuadratic.m", "getSupportedInterfaces.m"]);
    assert(isempty(issues.Issues), "Code issues found.");
end

function testTask(~)
    results = runtests(pwd, "IncludeSubfolders", true);
    assertSuccess(results);
end

function packageTask(~)
    matlab.addons.toolbox.packageToolbox("quadDemo.prj");
end
