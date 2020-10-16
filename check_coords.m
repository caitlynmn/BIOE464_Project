function checked_coordinates = check_coords(coordinates,Ncube)

% This function takes in the coordinates of the particles and checks if
% there are first any particles outside of the cubic lattice and then
% checks if there are any particle overlaps. If one of the conditions is
% true, then the coordinates are corrected.

for particle = 1:length(coordinates)    %iterates over all particles
    for component = 1:3    %iterates over each particle's position coordinate
        if coordinates(component,particle) > Ncube/2   %checks if outside of lattice
            coordinates(component,particle) = coordinates(component,particle) - Ncube/2; %corrects
        elseif coordinates(component, particle) < Ncube/2
            coordinates(component,particle) = coordinates(component,particle) + Ncube/2;
        end
    end
end

checked_coordinates = coordinates(:,:);
[uniques,I,J] = unique(checked_coordinates', 'rows', 'first');    % find unique coordinates
duplicaterows = setdiff(1:size(checked_coordinates',1), I);       % find duplicate row indices

while length(duplicaterows) >= 1       %branches if there are duplicates
    %create new randomly assigned coordinates in x, y, and z
    
    checked_coordinates(:,duplicaterows(1)) = -Ncube/2 + (Ncube)*rand(3,1); %replaces old coordinates
    
    [uniques,I,J] = unique(checked_coordinates', 'rows', 'first'); %checks for unique coordinates again
    duplicaterows = setdiff(1:size(checked_coordinates',1), I);   % checks for duplicates again
end