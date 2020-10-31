function new_coordinate_lattice = displace_particle(particle_index, coordinate_matrix,L)
% This function takes in the particle number, initial coordinates, and box
% length to randomly generate movement for the particle. It checks periodic
% boundary conditions using PBC_displacement to ensure no overlap or out of
% boundaries. Outputs the coordinates of the lattice with the replaced
% proposed movement.

% Output of function is the coordinate lattice with the proposed moved
% particle
% 
condition = 0;

while condition == 0
    proposed_movement = -L/2 + (L)*rand(3,1);
    proposed_coords = coordinate_matrix(:,:);
    proposed_coords(:,particle_index) = proposed_movement;
    condition = PBC_displacement(particle_index,proposed_movement,coordinate_matrix,L);
end

new_coordinate_lattice = proposed_coords;
end