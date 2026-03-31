# MATLAB quad

Created to show CI/CD.

![MATLAB Tests](https://github.com/mikecroucher/quadDemo/actions/workflows/ci.yml/badge.svg)

## Building the Toolbox

This project uses MATLAB's [build tool](https://www.mathworks.com/help/matlab/matlab_prog/overview-of-matlab-build-tool.html) to automate code analysis, testing, and toolbox packaging.

### Prerequisites

- MATLAB R2025a or later

### Build Tasks

From the MATLAB Command Window, run:

```matlab
buildtool check    % Run static code analysis
buildtool test     % Run code analysis then tests
buildtool package  % Run code analysis, tests, then package the .mltbx
```

The `package` task produces a `quadDemo.mltbx` toolbox installation file.

### From the System Command Line

```bash
matlab -batch "buildtool package"
```
