% This is a driver script to test the function powerValidityCheck

% test case 1 - input within limits and numeric
expectedOutput = 1;
actualOutput = powerValidityCheck('90');
fprintf('test case 1 - input within numeric and within limits\n ')
fprintf('input: 90, expected: %d, got: %d \n', expectedOutput, actualOutput);

% test case 2 - input within limits and numeric
expectedOutput = 1;
actualOutput = powerValidityCheck('20');
fprintf('test case 2 - input within numeric and within limits\n')
fprintf('input: 20, expected: %d, got: %d \n', expectedOutput, actualOutput);

% test case 3 - check for zero
expectedOutput = 0;
actualOutput = powerValidityCheck('0');
fprintf('test case 3 - check for zero\n ')
fprintf('input: 0, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 4 - check for max allowed input
expectedOutput = 1;
actualOutput = powerValidityCheck('100');
fprintf('test case 4 - check for max allowed input\n ')
fprintf('input: 100, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 5 - check for min allowed input
expectedOutput = 1;
actualOutput = powerValidityCheck('1');
fprintf('test case 5 - check for min allowed input\n ')
fprintf('input: 1, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 6 - check for pi
expectedOutput = 0;
actualOutput = powerValidityCheck('pi');
fprintf('test case 6 - check for pi\n ')
fprintf('input: pi, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 7 - check for symbols($)
expectedOutput = 0;
actualOutput = powerValidityCheck('$');
fprintf('test case 7 - check for symbols($)\n ')
fprintf('input: $, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 8 - check for symbols(#)
expectedOutput = 0;
actualOutput = powerValidityCheck('$');
fprintf('test case 8 - check for symbols(#)\n ')
fprintf('input: #, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 9 - check for decimals
expectedOutput = 1;
actualOutput = powerValidityCheck('23.56');
fprintf('test case 9 - check for decimals\n ')
fprintf('input: 23.56, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 10 - check for decimals
expectedOutput = 1;
actualOutput = powerValidityCheck('23.237856');
fprintf('test case 10 - check for decimals\n ')
fprintf('input: 23.237856, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 11 - check for negative number
expectedOutput = 0;
actualOutput = powerValidityCheck('-90');
fprintf('test case 11 - check for negative number\n ')
fprintf('input: -90, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 12 - check for negative number that is a decimals
expectedOutput = 0;
actualOutput = powerValidityCheck('-4.78');
fprintf('test case 12 - check for decimals\n ')
fprintf('input: -4.78, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 13 - check for symbols and a number that is within the limit
expectedOutput = 0;
actualOutput = powerValidityCheck('12$');
fprintf('test case 13 - check for symbols and a number that is within the limit \n')
fprintf('input: 12$, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 14 - check for a very big number 
expectedOutput = 0;
actualOutput = powerValidityCheck('778676');
fprintf('test case 14 - check for a very big number\n')
fprintf('input: 778676, expected: %d, got: %d\n', expectedOutput, actualOutput);

% test case 15 - check for a very small number 
expectedOutput = 0;
actualOutput = powerValidityCheck('0.000001');
fprintf('test case 15 - check for a very small number\n')
fprintf('input: 0.000001, expected: %d, got: %d\n', expectedOutput, actualOutput);






















