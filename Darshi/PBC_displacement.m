function checked_coordinates = PBC_displcaement(particle,coordinates,L)

% This function takes in the coordinates of the moved particle and checks if
% there are first any particles outside of the cubic lattice and then
% checks if there are any particle overlaps. If one of the conditions is
% true, then the coordinates are corrected.

checked_coordinates = coordinates;

[uniques,I,J] = unique(checked_coordinates', 'rows', 'first');    % find unique coordinates
duplicaterows = setdiff(1:size(checked_coordinates',1), I);       % find duplicate row indices

checked = 0;

while length(duplicaterows) >= 1 || checked == 0;
    %create new randomly assigned coordinates in x, y, and z
    
    for component = 1:3    %iterates over each particle's position coordinate
        while checked_coordinates(component,particle) > L/2   %checks if outside of lattice
            checked_coordinates(component,particle) = checked_coordinates(component,particle) - rand(1); %corrects
        end
        while checked_coordinates(component, particle) < -L/2
            checked_coordinates(component,particle) = checked_coordinates(component,particle) + rand(1);
        end
    end
    checked = 1;
  
    [uniques,I,J] = unique(checked_coordinates', 'rows', 'first'); %checks for unique coordinates again
    duplicaterows = setdiff(1:size(checked_coordinates',1), I);   % checks for duplicates again
end
end