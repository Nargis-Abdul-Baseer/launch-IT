% This script creates a function named powerValid which checks if the power
% is numeric and within limits, then it returns a true if it is valid and 
% false if its invalid which stored in isValid.

function [isValid] = powerValidityCheck(powerInput)
    % POWERVALIDITYCHECK checks if the power entered by the user is numeric
    % and between 1 to 100, then it returns a true if it is valid and 
    % false if its invalid which stored in the variable named isValid.

    % Check if the input is numeric
    if ~isnan(str2double(powerInput))
        % If the input is a numeric it is coverted and stored as a double
        powerInput = str2double(powerInput);
        % Check if the input is within the limits and numeric
        if isnumeric(powerInput) && powerInput >= 1 && powerInput <= 100
            isValid = true; % isValid is stored as true if input is numeric and within the limits
        else
            isValid = false; % isValid is stored as false if input is not numeric and within the limits 
        end
    else
        isValid = false; % isValid is stored as false if input is not numeric
    end
end

