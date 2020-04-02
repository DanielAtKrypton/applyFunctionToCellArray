function result = applyFunctionToCellArray(functionHandle, data, alongDimension)
%APPLYFUNCTIONTOCELLARRAY Applies function to a cell array along the specified dimension.
dataSize = size(data);
switch alongDimension
case 1
    result = arrayfun(@(i1) functionHandle(data{i1,:}), (1:dataSize(alongDimension))', 'UniformOutput', false);
case 2
    result = arrayfun(@(i1) functionHandle(data{:,i1}), (1:dataSize(alongDimension))', 'UniformOutput', false)';
end