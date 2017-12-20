% Finds the indices of the cell that holds the minimum cost
% costs : The matrix that contains the estimation costs for a block
% dx : the motion vector component in columns
% dy : the motion vector component in rows

function [dx, dy, min] = minCost(costs)

[row, col] = size(costs);

% we check whether the current
% value of costs is less then the already present value in min. If its
% inded smaller then we swap the min value with the current one and note
% the indices.

min = costs(8,8);
dx=8;
dy=8;
% Finding minimum from all 15*15 MAD values
for i = 1:15
    for j = 1:15        
        if costs(i,j) < min
            dis = sqrt((i-8)^2+(j-8)^2);
            min = costs(i,j);
            dx = j; dy = i;
        end
    end
end
end

