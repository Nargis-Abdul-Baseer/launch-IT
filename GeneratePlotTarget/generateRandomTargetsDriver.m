% This is a driver to test the functions generateRandomTargets and
% plotTargets. It checks if the targets are random and within the range.

% loopLens variable stores the number of times the two function are repeated
loopLens = [5,10,100,1000];

% Using for loop to use the two functions 5,10,100 and 1000 times.
for i = 1:length(loopLens)
    clf % Clear the current graph
    % setting the max x and y intreval of the graph as 0:200 and 0:500 repectively,
    % as the game uses these intreval only to play the game
    xlim([0 200]);
    ylim([0 500]);
    for j = 1:loopLens(i)
        targetMatrix = generateRandomTargets();
        plotTargets(targetMatrix)
    end
    % Saving the current graph with a unique name 
    testFileName = ['testTarget',num2str(i),'.png']; 
    saveas(gcf,testFileName)
end

% Using the for loop to test the graph 10 times, each time the targets are
% drawn in a new graph. This is to compare the randomness of the points.  
for i = 1:10
    clf % Clear the current graph
    % setting the max x and y intreval of the graph as 0:200 and 0:500 repectively,
    % as the game uses these intreval only to play the game
    xlim([0 200]);
    ylim([0 500]);
    targetMatrix = generateRandomTargets();
    plotTargets(targetMatrix)
    % Saving the current graph with a unique name
    testFileName = ['testTargetRand',num2str(i),'.png']; 
    saveas(gcf,testFileName)
 end



