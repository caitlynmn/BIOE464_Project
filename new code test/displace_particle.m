function new_coordinate_lattice = displace_particle(particle_index, initial_coords,L)
% This function takes in the particle number, initial coordinates, and box
% length to randomly generate movement for the particle. It checks periodic
% boundary conditions using PBC_displacement to ensure no overlap or out of
% boundaries. Outputs the coordinates of the lattice with the replaced
% proposed movement.

% Output of function is the coordinate lattice with the proposed moved
% particle

proposed_movement = rand(3,1); %simulate proposed movement of single particle

condition = PBC_displacement(particle_index,proposed_movement,initial_coords,L);
%check/correct for no particle overlap and within boundaries from moved particle

while condition == 0
    proposed_movement = -L/2 + (L)*rand(3,1);
    condition = PBC_displacement(particle_index,proposed_movement,initial_coords,L);
end
proposed_coords = initial_coords(:,:);
proposed_coords(:,particle_index) = proposed_movement;

new_coordinate_lattice = proposed_coords;
end