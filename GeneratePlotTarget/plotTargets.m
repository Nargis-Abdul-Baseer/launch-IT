% This script creates a function named plotTargets, which plots 3
% randomly generated targets 

function [] = plotTargets(targetMatrix)
    % PLOTTARGETS plots the three randomly generated target as 'o' in blue colour in the same graph
    
    hold on % plot the three targets in the same graph 
    
    plot((targetMatrix(1,1)), (targetMatrix(1,2)), 'o', 'MarkerEdgeColor', 'b')
    plot((targetMatrix(2,1)), (targetMatrix(2,2)), 'o', 'MarkerEdgeColor', 'b')
    plot((targetMatrix(3,1)), (targetMatrix(3,2)), 'o', 'MarkerEdgeColor', 'b')
    
    hold off 
end






