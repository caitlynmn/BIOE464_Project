function computed_energies = compute_particle_E(proposed_coordinates,part,L) 

N = length(proposed_coordinates); % number of particles

if part == 0   
    % Loop over all distinct particle pairs
    for partA = 1:N
        energy = 0;
        for partB = 1:N
            if partB == partA
            continue
            else

            % compute distance
            r = proposed_coordinates(:,partA) - proposed_coordinates(:,partB);
            
            for component = 1:3
                if abs(r(component)) > L/2
                    r(component) = L/2 - r(component);
                end
            end
    
            % distance squared
            r_2 = sum(dot(r,r));

            % LJ potential:
            % U(r) = 4*epsilon* [(sigma/r)^12 - (sigma/r)^6]
            %
            % Reduced units: sigma = 1, epsilon = 1
            %
            % U(r) = 4 * [(1/r)^12 - (1/r)^6]

            invr_6 = 1.0/(r_2^3); % 1/r^6
            pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
            energy = energy + pairwise_energy; % add to energy variable
            end

        end
        computed_energies(partA) = energy*4; %multiply by 4 after all energies between particles calculated
    end
else
    partA = part;
    energy = 0;
    for partB = 1:N
        if partB == partA
            continue
        else
            % compute distance
            r = proposed_coordinates(:,partA) - proposed_coordinates(:,partB);
            
            for component = 1:3
                if abs(r(component)) > L/2
                    r(component) = L/2 - r(component);
                end
            end

            % distance squared
            r_2 = sum(dot(r,r));

            % LJ potential:
            % U(r) = 4*epsilon* [(sigma/r)^12 - (sigma/r)^6]
            %
            % Reduced units: sigma = 1, epsilon = 1
            %
            % U(r) = 4 * [(1/r)^12 - (1/r)^6]
            
            invr_6 = 1.0/(r_2^3); % 1/r^6
            pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
            energy = energy + pairwise_energy; % add to energy variable
            
        end
    end
    computed_energies = energy*4; %multiply by 4 after all energies between particles calculated
end
end
