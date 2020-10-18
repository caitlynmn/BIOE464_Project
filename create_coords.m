function coordinates = create_coords(N,L)

% This function creates and outputs randomly generated coordinates in the
% x, y, and z directions for each particle N.
% Coordinates are within the range of -L/2 to L/2.

for i = 1:N   %iterates for every particle
    %creates random coordinate for x, y, and z
    coordinates(:,i) = -L/2 + (L)*rand(3,1);  %adds new coordinate
end

[uniques,I,J] = unique(coordinates', 'rows', 'first');    % find unique coordinates
duplicaterows = setdiff(1:size(coordinates',1), I);       % find duplicate row indices

while length(duplicaterows) >= 1       %branches if there are duplicates
    %create new randomly assigned coordinates in x, y, and z
    
    coordinates(:,duplicaterows(1)) = -L/2 + (L)*rand(3,1); %replaces old coordinates
    
    [uniques,I,J] = unique(coordinates', 'rows', 'first'); %checks for unique coordinates again
    duplicaterows = setdiff(1:size(coordinates',1), I);   % checks for duplicates again
end
