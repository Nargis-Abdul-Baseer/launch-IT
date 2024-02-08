% This version of the project calculates the y cordinates of the projectile
% that is within the graph limit and it is stored as the variable named
% heightVec. It then lots the projectile with the 3 targets so the user can
% see if any of the targets is hit.

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

% Covert the variable power from string to numeric so calculation can be
% performed
power = str2double(power);

% Defining the x-axis interval for which the corresponding
% height(y-axis) will be plot, based on the power input
xAxisInterval = 1:0.0001:200;

% Predefining the vector conataing the y coordinates of the projectile 
heightVec = zeros(size(xAxisInterval));

% For-loop to calculate the height(y-axis) of the projectile 
for i = 1:length(xAxisInterval)
    heightVec(i) = -(1/power)*xAxisInterval(i)^2 + 500;
end

% Setting the x and y intrevals of the graph used to play the game as 0:200
% and 0:500 repectively 
xlim([0 200]);
ylim([0 500]);

% Plotting the 3 targets
plotTargets(targets)

% Plotting the projectile in the same graph as the targets to check if any
% target is hit
hold on 
plot(xAxisInterval,heightVec); 
hold off
