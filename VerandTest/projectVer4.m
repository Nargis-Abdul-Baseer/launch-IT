% This version of the project check if any of the 3 targets is hit by
% calculating the absolute different between the x and y cordinates of the
% targets and the projectile points. If any target is hit, a message
% saying "You WIN!" is displayd else "you LOSE" is diplayed.

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

% Initialising the variable that checks if any of the target is hit as zero
targetHit = 0;

% Using For loop the distance between the points in the projectile and
% targets is calculated and if both x and y are close enough (only have a
% difference of 2 or less in x axis and 5 or less in the y axis) means the
% point has been hit and the variable targetHit is stored as 1 else it
% remains zero
for i = 1:length(heightVec) 
    if abs(xAxisInterval(i)-targets(1,1))<=2 && abs(heightVec(i)-targets(1,2))<=5 ...
       || abs(xAxisInterval(i)-targets(2,1))<=2 && abs(heightVec(i)-targets(2,2))<=5 ...
       || abs(xAxisInterval(i)-targets(3,1))<=2 && abs(heightVec(i)-targets(3,2))<=5
        targetHit = 1; % if any of the target is hit, the variable is stored as 1
    end
end

% If any target is hit, a message saying "You WIN!" is displayd else "you LOSE" is diplayed.
if targetHit == 1
    disp("You WIN!")
else
    disp("You lose")
end