function satisfied_condition = PBC_displcaement(particle_number,proposed_movement,coordinates,L)

% This function takes in the coordinates of the moved particle and checks if
% there are first any particles outside of the cubic lattice and then
% checks if there are any particle overlaps. If one of the conditions is
% true, then the coordinates are corrected.

proposed_coords = coordinates(:,:);  %duplicate initial coordinates
proposed_coords(:,particle_number) = proposed_movement;   %substitute particle with new particle movements

for component = 1:3    %iterates over each particle's position coordinate
    if proposed_coords(component,particle_number) > L/2   %checks if outside of lattice
        satisfied_condition = 0; %corrects
    elseif proposed_coords(component, particle_number) < -L/2
        satisfied_condition = 0;
    end
end

[uniques,I,J] = unique(proposed_coords', 'rows', 'first'); %checks for unique coordinates again
duplicaterows = setdiff(1:size(proposed_coords',1), I);   % checks for duplicates again

if length(duplicaterows) >= 1
    satisfied_condition = 0;
else
    satisfied_condition = 1;
end
end