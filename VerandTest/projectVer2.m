% This version of the project prompts the user for the power of launch,
% which is used to calculate the projectile path. It also checks the
% validity of the power - only numeric value within 1 to 100 is accepted.

% Close all open figures 
close all
% Clear command window
clc

% Setting the x and y intrevals of the graph used to play the game as 0:200
% and 0:500 repectively so the scale is same throughout the game and full
% graph is always shown 
xlim([0 200]);
ylim([0 500]);

% Create three random points which are the targets for the user to hit  
targets = generateRandomTargets();

% Ploting the points(targets) in the graph for the user 
plotTargets(targets);

% Prompt to ask the user for power of the launch, which should be a numeric value
% bewteen 1 and 100
power = input("Enter power between 1 and 100: ", 's');

% While loop checks if the power is numeric and within limits, it is
% invalid an error prompt is displayed and the user has to enter the power
% again until it is valid
powerValid = false; % Initialising powerValid as false

if ~powerValidityCheck(power)
    while ~powerValid 
            fprintf("Invalid input. Enter a numeric value between 1 and 100 only. \n\n");
            power = input("Enter power between 1 and 100: ", 's');
            powerValid = powerValidityCheck(power);
    end
end












