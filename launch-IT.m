% definign the x and y interval, so it always show full range of x and y
% axis in order for the scale to be same later on
xlim([0 200]);
ylim([0 500]);

% finding the coordinates of the tagrets randomly 
target = zeros(3, 2);

for xaxis = 1:3
    randx = randi(150);  % after 50 if higer than 
    for yaxis = 1:3
        randy = randi(300);
        target(xaxis, :) = [randx, randy];
    end
end

% plot the tagets in the same graph
hold on 

plot((target(1,1)), (target(1,2)), 'o', 'MarkerEdgeColor', 'b')
plot((target(2,1)), (target(2,2)), 'o', 'MarkerEdgeColor', 'b')
plot((target(3,1)), (target(3,2)), 'o', 'MarkerEdgeColor', 'b')

hold off 

% prompts the user to enter coeddifcient of x^2 which is used to find
% height in this game defined as 'power' 
disp("Enter power between 1 to 100, 100 being the maxium ")
disp("Be careful as you get closer to  the cliff the sensitivity of the power increases!")
power = input('enter power : ');

% check if the input is numeric and within the allowed limit
while (~isnumeric(power) || power < 1 || power > 100)
    disp("Invalid input. Power must be between 1 and 100.")
    power = input('Enter power between 1 to 100, 100 being the maximum: ');
end

% calculate height at each point along the range
x = 0:1:200;

hold on
xlim([0 200]);
ylim([0 500]);

height = zeros(size(x));

for i = 1:length(x)
    height(i) = -(1/power)*x(i)^2 + 500;
end

hold on

plot((target(1,1)), (target(1,2)), 'o', 'MarkerEdgeColor', 'b')
plot((target(2,1)), (target(2,2)), 'o', 'MarkerEdgeColor', 'b')
plot((target(3,1)), (target(3,2)), 'o', 'MarkerEdgeColor', 'b')

for i = 1:length(x)
    plot(x(i), height(i), '*', 'MarkerEdgeColor', 'r'); 
    drawnow;
end

hold off

% check if any of the targets have been hit
counter = 0;
for i = 1:150
    for j = 1:500
        if any([abs(x(i)-target(1,1))<=3 && abs(height(i)-target(1,2))<=10; 
                abs(x(i)-target(2,1))<=3 && abs(height(i)-target(2,2))<=10; 
                abs(x(i)-target(3,1))<=3 && abs(height(i)-target(3,2))<=10])
            counter = 1;
            break
        end
    end
end
if counter == 1
    disp("win")
else
    disp("lose")
end

% correct the accuracy if win and lose, three chance to draw line, count how many correct, difficult level -
% accuracy changes, you can ask chatgpt to make it function so its cleaner
% and do tetsing on each fucntion 