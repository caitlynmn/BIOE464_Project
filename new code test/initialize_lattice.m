function initial_coords = initialize_lattice(N,L)
%% Testing with setting up a regular lattice, ignore this function

index = [0;0;0];

% Assign particle positions
for part=1:N
    % Set coordinate
    initial_coords(:,part) = index - L/2;

    % Advance the index
    index = index + 1;
    
    if index(1) > L/2
        index(1) = 0;
    end
    
    if index(2) > L/2
        index(2) = 0;
    end
    
    if index(3) > L/2
        index(3) = 0;
    end
    
    end
    initial_coords = initial_coords - L/2;
end