% This version of the project generates and plots 3 random points in a graph which are
% the targets for the user.

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