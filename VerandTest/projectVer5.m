% In this version, the user has 3 attempts to hit the target, and as they
% hit a target the cordinates of that target are displayed and a message
% prompt tells them what attempt they are on and how many they have hit so
% far. It also determines if the user has won the game, in the 3 attemps if the
% user sucessfully hits atleast 1 target then it is a win.
        
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

% Check if any of the targets have been hit, if 1st target hit the first
% element changes to 1, if second target hit the second element changes to
% 1 and if third target hit then the third element changes to 1
targetHit = [0,0,0];

% Check if a target has been hit for the first time
checkTargetHitFirstTime = [false, false, false];

for attempts = 1:3
    % Informing the user the number of attempts so far    
    fprintf('this is the %d attempt out of 3 \n\n',attempts)

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
     
        % Using For loop the distance between the points in the projectile and
        % targets is calculated and if both x and y are close enough (only have a
        % difference of 2 or less in x axis and 5 or less in the y axis) means the
        % point has been hit
        for i = 1:length(heightVec)
            if abs(xAxisInterval(i)-targets(1,1))<=2 && abs(heightVec(i)-targets(1,2))<=5
                if ~checkTargetHitFirstTime(1) % check if the first target is hit for the first time 
                    fprintf('You hit the first target at (%d,%d)\n', targets(1,1), targets(1,2))
                    checkTargetHitFirstTime(1) = true;
                end
                targetHit(1) = 1; % if the first target is hit the first element of the vector targetHit is changed to 1 from 0
        
            elseif abs(xAxisInterval(i)-targets(2,1))<=2 && abs(heightVec(i)-targets(2,2))<=5
                if ~checkTargetHitFirstTime(2) % check if the second target is hit for the first time
                    fprintf('You hit the second target at (%d,%d)\n', targets(2,1), targets(2,2))
                    checkTargetHitFirstTime(2) = true;
                end
                targetHit(2) = 1; % if the second target is hit the first element of the vector targetHit is changed to 1 from 0
        
            elseif abs(xAxisInterval(i)-targets(3,1))<=2 && abs(heightVec(i)-targets(3,2))<=5
                if ~checkTargetHitFirstTime(3)
                    fprintf('You hit the third target at (%d,%d)\n', targets(3,1), targets(3,2))
                    checkTargetHitFirstTime(3) = true; % check if the third target is hit for the first time
                end
                targetHit(3) = 1; % if the third target is hit the first element of the vector targetHit is changed to 1 from 0        
            end       
        end
        
        fprintf('you have hit %d of the 3 targets in total \n\n',sum(targetHit));
end

% If statement to determine if user has won or not, in the 3 attemps if the
% user sucessfully hits atleast 1 target then it is a win.
        
if sum(targetHit)>=1
    disp("You WIN!")
else
    disp("You Lose")
end
