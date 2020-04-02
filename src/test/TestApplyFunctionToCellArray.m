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
        function testApplyCellFunctionColumnWise(testCase)
            data = {
                fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
                'fileA', 'fileB', 'fileC'
            };
            expectedResult = {fullfile('root', 'pathA', 'fileA'), fullfile('root', 'pathB', 'fileB'), fullfile('root', 'pathC', 'fileC')};
            result = applyCellFunctionToCellArray(@fullfile, data, 1);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end
        function testApplyCellFunctionRowWise(testCase)
            data = {
                fullfile('root', 'pathA'), fullfile('root', 'pathB'), fullfile('root', 'pathC');
                'fileA', 'fileB', 'fileC'
            };
            expectedResult = {
                fullfile('root', 'pathA', 'root', 'pathB', 'root', 'pathC');
                fullfile('fileA', 'fileB', 'fileC')
            };
            result = applyCellFunctionToCellArray(@fullfile, data, 2);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end   
        function testApplyFunctionColumnWise(testCase)
            data = {
                [1 2] [2 3] [3 4];
                [4 5] [5 6] [6 7]
            };
            expectedResult = {
                mean([[1 2] [2 3] [3 4]], 2);
                mean([[4 5] [5 6] [6 7]], 2)
            };
            result = applyFunctionToCellArray(@mean, data, 2, 2);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end
        function testApplyFunctionRowWise(testCase)
            data = {
                [1 2] [2 3] [3 4];
                [4 5] [5 6] [6 7]
            };
            expectedResult = {
                mean([[1 2]; [4 5]],1), mean([[2 3]; [5 6]], 1), mean([[3 4]; [6 7]], 1) 
            };
            result = applyFunctionToCellArray(@mean, data, 1, 1);
            testCase.verifyEqual(result, expectedResult, 'Results must match');
        end        
    end
end