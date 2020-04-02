function result = applyFunctionToCellArray(functionHandle, data, alongDimension)
%APPLYFUNCTIONTOCELLARRAY Applies function to a cell array along the specified dimension.
dataSize = size(data);
result = arrayfun(@(i1) functionHandle(data{:,i1}), (1:dataSize(alongDimension))', 'UniformOutput', false);

