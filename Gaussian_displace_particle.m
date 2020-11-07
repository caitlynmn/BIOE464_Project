function new_coordinate_lattice = Guassian_displace_particle(particle_index, coordinate_matrix,L,sigma)

% This function takes in the particle number, initial coordinates, and box
% length to randomly generate movement for the particle. It checks to ensure
% no overlap or out of boundaries. Coordinates are automatically placed
% within boundaries of [-L/2 L/2]

% Output of function is the coordinate lattice with the proposed moved
% particle

condition = 0;
x=coordinate_matrix(particle_index);


while condition == 0
    proposed_movement = normrnd(0,sigma,[3,1])+coordinate_matrix(:,particle_index); %Make a random Gaussian displacement for the particle 
    old_coordinates=coordinate_matrix(:,particle_index);
    
    for coords=1:3 %Checks if particle will be in the boundary
        while abs(proposed_movement(coords))>L/2
            proposed_movement(coords)=L*normrnd(0,sigma,1)+old_coordinates(coords);
            %-L/2+(L)*rand(1)+old_coordinates(coord);
        end
    end
    
    %{
    old_coordinates=coordinate_matrix(:,particle_index);
    for coord=1:3
        while abs(proposed_movement(coord))>L/2
            proposed_movement(coord) =normrnd(0,1,[3,1])+old_coordinates(coord);
            %-L/2+(L)*rand(1)+old_coordinates(coord);
        end
    end
    %}
            
        
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