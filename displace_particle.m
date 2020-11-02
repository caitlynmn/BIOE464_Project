function new_coordinate_lattice = displace_particle(particle_index, coordinate_matrix,L)

% This function takes in the particle number, initial coordinates, and box
% length to randomly generate movement for the particle. It checks to ensure
% no overlap or out of boundaries. Coordinates are automatically placed
% within boundaries of [-L/2 L/2]

% Output of function is the coordinate lattice with the proposed moved
% particle

condition = 0;

while condition == 0
    proposed_movement = -L/2 + (L)*rand(3,1);    % puts particles in [-L/2 L/2]
    proposed_coords = coordinate_matrix(:,:);
    proposed_coords(:,particle_index) = proposed_movement;
    
    [uniques,I,J] = unique(proposed_coords', 'rows', 'first'); % checks for unique coordinates
    duplicaterows = setdiff(1:size(proposed_coords',1), I);   % checks for duplicates

    if length(duplicaterows) >= 1
        condition = 0;
    else
        condition = 1;
    end
end

new_coordinate_lattice = proposed_coords;
end