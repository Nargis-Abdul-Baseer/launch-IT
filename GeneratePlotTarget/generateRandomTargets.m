% This script creates a function named generateRandomTargets which
% generates 3 random points(targets) with x and y cordinates.

function [targetMatrix] = generateRandomTargets()
    % GENERATERANDOMTARGETS creates a matrix with 3 rows and 2 columns. Column 1 and 2
    % represntes x and y cordinates respectively and each rows represents the 
    % x and y codinates of one point(target).
    
    % Predefining the matrix containing the coordinates of the targets with zeros, 
    % so the x and y coordinates of all the target is set as 0 
    targetMatrix = zeros(3,2);
    
    % Using for loop to randomly assign the x and y cordinates of the 3
    % targets.It only randomly generates the x coordinates in the range [30:140 ]
    % y coordinates within the range [0:275] so the targets generated are 
    % within the region that can be hit only.
    for i = 1:3
        targetMatrix(i, 1) = randi([30, 140]); 
        targetMatrix(i, 2) = randi([0, 275]); 
    end

end