# Apply Function To Cell Array

## Table of Contents

1. [Acknowledgements](#acknowledgements)
2. [Description](#description)
3. [Syntax](#syntax)
4. [Examples](#examples)
5. [Test](#test)
6. [References](#references)

## Acknowledgements

Based on the work of [Andrei Bobrov](https://www.mathworks.com/matlabcentral/profile/authors/2823630-andrei-bobrov). See reference implementation [here](https://www.mathworks.com/matlabcentral/answers/24538-row-wise-concatenation-of-a-cell-array).

## Description

Applies function to a cell array along the specified dimension.

## Syntax

```matlab
% result = applyFunctionToCellArray(functionHandle, data, alongDimension)
```

## Examples

```matlab
% apply function column wise
data = {
    fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
    'fileA', 'fileB', 'fileC'
};
result = applyFunctionToCellArray(@fullfile, data, 2);

% apply function row wise
data = {
    fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
    'fileA', 'fileB', 'fileC'
};
result = applyFunctionToCellArray(@fullfile, data, 1);
```

## Test

```matlab
testsResults = runtests('TestApplyFunctionToCellArray')
```

## References
