function new_coordinate_lattice = displace_particle(particle_index, initial_coords,L)
% This function takes in the particle number, initial coordinates, and box
% length to randomly generate movement for the particle. It checks periodic
% boundary conditions using PBC_displacement to ensure no overlap or out of
% boundaries. Outputs the coordinates of the lattice with the replaced
% proposed movement.

% Output of function is the coordinate lattice with the proposed moved
% particle

particle_position = initial_coords(:,particle_index); %gets initial coordinates of particle

proposed_movement = (rand(3,1)); %simulate proposed movement of single particle
proposed_coords = initial_coords(:,:);  %duplicate initial coordinates
proposed_coords(:,particle_index) = proposed_movement;   %substitute particle with new particle movements

checked_proposed_coords = PBC_displacement(particle_index,proposed_coords,L);
%check/correct for no particle overlap and within boundaries from moved particle

new_coordinate_lattice = checked_proposed_coords;
end