classdef TransmitterTest < matlab.unittest.TestCase
    %TRANSMITTERTEST Test transmitter
    %   Use this class to test the transmitter routines
    
    % Test methods
    methods (Test)
        % Test points of a fixed constellation
        function test_fixed_constellation(testCase)
            C = constellations(4); % Test 16-QAM
            C_true = [-3.0000 - 3.0000i;...
                -1.0000 - 3.0000i;...
                3.0000 - 3.0000i;...
                1.0000 - 3.0000i;...
                -3.0000 - 1.0000i;...
                -1.0000 - 1.0000i;...
                3.0000 - 1.0000i;...
                1.0000 - 1.0000i;...
                -3.0000 + 3.0000i;...
                -1.0000 + 3.0000i;...
                3.0000 + 3.0000i;...
                1.0000 + 3.0000i;...
                -3.0000 + 1.0000i;...
                -1.0000 + 1.0000i;...
                3.0000 + 1.0000i;...
                1.0000 + 1.0000i];
            verifyEqual(testCase,C,C_true,'RelTol',1e-5);
        end
        
        % Test that all constellations are Gray-mapped
        function test_all_const(testCase)
            for i = 2:10
                [~,B] = constellations(i);
                s = issorted(fliplr(B)*2.^(0:(i-1))');
                verifyTrue(testCase,s);
            end
        end
        
        % Test that all constellations are Gray-mapped
        function test_all_psk_const(testCase)
            for i = 2:6
                [~,B] = psk_constellations(i);
                s = issorted(fliplr(B)*2.^(0:(i-1))');
                verifyTrue(testCase,s);
            end
        end
        
        % Test points of a fixed PSK constellation
        function test_fixed_psk_constellation(testCase)
            C = psk_constellations(4);
            C_true = [1.0000 + 0.0000i;...
                0.9239 + 0.3827i;...
                0.3827 + 0.9239i;...
                0.7071 + 0.7071i;...
                -0.9239 + 0.3827i;...
                -0.7071 + 0.7071i;...
                0.0000 + 1.0000i;...
                -0.3827 + 0.9239i;...
                0.9239 - 0.3827i;...
                0.7071 - 0.7071i;...
                -0.0000 - 1.0000i;...
                0.3827 - 0.9239i;...
                -1.0000 + 0.0000i;...
                -0.9239 - 0.3827i;...
                -0.3827 - 0.9239i;...
                -0.7071 - 0.7071i];
            verifyEqual(testCase,C,C_true,'RelTol',1e-3);
        end
        
        % Test PRBS generator
        function test_prbs_generator(testCase)
            s = sum(PRBS_generator( 1, 8, 1));
            verifyEqual(testCase,s,128);
        end
    end
end
