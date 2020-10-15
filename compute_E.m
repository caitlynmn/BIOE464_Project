function energy_matrix=compute_E(corrected_coords) 

N = length(corrected_coords); % number of particles

% Loop over all distinct particle pairs
for particle = 1:N
    energy = 0;
    for particle2 = (particle+1):N

        % compute distance
        r = corrected_coords(:,particle) - corrected_coords(:,particle2);

        % distance squared
        r_2 = sum(dot(r,r));

        % LJ potential:
        % U(r) = 4*epsilon* [(sigma/r)^12 - (sigma/r)^6]
        %
        % Reduced units: sigma = 1, epsilon = 1
        %
        % U(r) = 4 * [(1/r)^12 - (1/r)^6]

        invr_6 = 1.0/(r_2^3); % 1/r^6
        energy = energy + (invr_6 * (invr_6 - 1)); % add to energy variable

    end
    energy_matrix(particle) = energy*4; %multiply by 4 after all energies between particles calculated
end
    
end
