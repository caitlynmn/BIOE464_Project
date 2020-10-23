function computed_energies = compute_whole_lattice_E(whole_lattice,L)
% This function computes all the energies of each particle in the whole
% lattice and outputs it as computed_energies in an array.

N = size(whole_lattice,2); % number of particles
% Loop over all distinct particle pairs
for partA = 1:N
    energy = 0;
    for partB = 1:N
        if partB == partA
        continue
        else

        % compute distance
        r = whole_lattice(:,partA) - whole_lattice(:,partB);
        
        for component = 1:3    %minimum image criterion
            if abs(r(component)) > L/2
                r(component) = L/2 - r(component);
            end
        end

        % distance squared
        r_2 = sum(dot(r,r));

        invr_6 = 1.0/(r_2^3); % 1/r^6
        pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
        energy = energy + pairwise_energy; % add to energy variable
        end

    end
    computed_energies(partA) = energy*4; %multiply by 4 after all energies between particles calculated
end
end