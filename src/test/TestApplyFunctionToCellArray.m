%% Test Class Definition
classdef TestApplyFunctionToCellArray < matlab.unittest.TestCase
   
    %% Test Method Block
    methods (Test)
        % includes unit test functions
        % function testAgainstBobrovsSolution(testCase)
        %     dirData = dir('**/*.m');
        %     data = vertcat({dirData.folder}, {dirData.name});

        %     result1 = arrayfun(@(i1)fullfile(data{:,i1}), (1:size(data,2))', 'UniformOutput', false);
        %     result2 = applyFunctionToCellArray(@fullfile, data, 2);
        %     testCase.verifyEqual(result1, result2, 'Results must match');
        % end
        function testApplyFunctionColumnWise(testCase)
            data = {
                fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
                'fileA', 'fileB', 'fileC'
            };
            expectedResult = {fullfile('root', 'pathA', 'fileA'), fullfile('root', 'pathB', 'fileB'), fullfile('root', 'pathC', 'fileC')};
            result = applyFunctionToCellArray(@fullfile, data, 1);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end
        function testApplyFunctionRowWise(testCase)
            data = {
                fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
                'fileA', 'fileB', 'fileC'
            };
            expectedResult = {
                fullfile('root', 'pathA', 'root', 'pathB', 'root', 'pathC');
                fullfile('fileA', 'fileB', 'fileC')
            };
            result = applyFunctionToCellArray(@fullfile, data, 2);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end        
    end
end