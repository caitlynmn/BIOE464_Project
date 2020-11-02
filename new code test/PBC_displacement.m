function satisfied_condition = PBC_displcaement(particle_number,proposed_move,coordinates,L)

% This function takes in the coordinates of the moved particle and checks if
% there are first any particles outside of the cubic lattice and then
% checks if there are any particle overlaps. If one of the conditions is
% true, then the coordinates are corrected.

proposed_coords = coordinates(:,:);  %duplicate initial coordinates
proposed_coords(:,particle_number) = proposed_move;   %substitute particle with new particle movements

[uniques,I,J] = unique(proposed_coords', 'rows', 'first'); %checks for unique coordinates again
duplicaterows = setdiff(1:size(proposed_coords',1), I);   % checks for duplicates again

if length(duplicaterows) >= 1
    satisfied_condition = 0;
else
    satisfied_condition = 1;
end
end