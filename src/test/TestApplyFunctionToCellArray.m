%% Test Class Definition
classdef TestApplyFunctionToCellArray < matlab.unittest.TestCase
   
    %% Test Method Block
    methods (Test)
        % includes unit test functions
        function testFullfile(testCase)
            dirData = dir('**/*.m');
            data = vertcat({dirData.folder}, {dirData.name});

            result1 = arrayfun(@(i1)fullfile(data{:,i1}), (1:size(data,2))', 'UniformOutput', false);
            result2 = applyFunctionToCellArray(@fullfile, data, 2);
            testCase.verifyEqual(result1, result2, 'Results must match');
        end
    end
end