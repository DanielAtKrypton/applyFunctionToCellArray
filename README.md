# Apply Function To Cell Array

## Table of Contents

1. [Acknowledgements](#acknowledgements)
2. [Description](#description)
3. [Syntax](#syntax)
4. [Examples](#examples)
5. [Test](#test)
6. [Limitations](#limitations)
7. [References](#references)

## Acknowledgements

Based on the work of [Andrei Bobrov](https://www.mathworks.com/matlabcentral/profile/authors/2823630-andrei-bobrov). See reference implementation [here](https://www.mathworks.com/matlabcentral/answers/24538-row-wise-concatenation-of-a-cell-array).

## Description

Applies function to a cell array along the specified dimension. It comes in two breeds:

- applyCellFunctionToCellArray
- applyFunctionToCellArray

## Syntax

```matlab
% result = applyCellFunctionToCellArray(functionHandle, data, alongDimension)
% result = applyCellFunctionToCellArray(functionHandle, data, alongDimension, fcnArg1, fcnArg2, ..., fcnArgN)


% result = applyFunctionToCellArray(functionHandle, data, alongDimension)
% result = applyFunctionToCellArray(functionHandle, data, alongDimension, fcnArg1, fcnArg2, ..., fcnArgN)
```

## Examples

### applyCellFunctionToCellArray

```matlab
data = {
    fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
    'fileA', 'fileB', 'fileC'
};
% apply function row wise
result = applyCellFunctionToCellArray(@fullfile, data, 1)

%result =
%
%  1×3 cell array
%
%    {'root\pathA\fileA'}    {'root\pathB\fileB'}    {'root\pathC\fileC'}

% apply function column wise
result = applyCellFunctionToCellArray(@fullfile, data, 2)
%result =
%
%  2×1 cell array
%
%    {'root\pathA\root\pathB\root\pathC'}
%    {'fileA\fileB\fileC'               }
```

### applyFunctionToCellArray

```matlab
data = {
[1 2] [2 3] [3 4];
[4 5] [5 6] [6 7]
};

% apply function column wise
res 1 = applyFunctionToCellArray(@mean, data, 2, 2)
%res1 =
%
%  2×1 cell array
%
%    {[2.5000]}
%    {[5.5000]}

% apply function row wise
res2 =  applyFunctionToCellArray(@mean, data, 1, 1);
res2{:}

%ans =
%
%    2.5000    3.5000
%
%
%ans =
%
%    3.5000    4.5000
%
%
%ans =
%
%    4.5000    5.5000
```

## Test

```matlab
testsResults = runtests('TestApplyFunctionToCellArray')
```

## Limitations

- Maximum input cell array dimension is currently 2.

## References
