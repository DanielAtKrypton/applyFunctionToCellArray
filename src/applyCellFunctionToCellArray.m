function result = applyCellFunctionToCellArray(functionHandle, data, alongDimension, varargin)
%APPLYFUNCTIONTOCELLARRAY Applies function to a cell array along the specified dimension.
dataSize = size(data);
switch alongDimension
case 1
    theOtherDimension = 2;
    result = arrayfun(@(i1) functionHandle(data{:,i1}, varargin{:}), (1:dataSize(theOtherDimension)), 'UniformOutput', false);
case 2
    theOtherDimension = 1;
    result = arrayfun(@(i1) functionHandle(data{i1,:}, varargin{:}), (1:dataSize(theOtherDimension))', 'UniformOutput', false);
end