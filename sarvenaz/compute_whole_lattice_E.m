function computed_energies = compute_whole_lattice_E(whole_lattice,L)
% This function computes all the energies of each particle in the whole
% lattice and outputs it as computed_energies in an array.

N = size(whole_lattice,2); % number of particles
% Loop over all distinct particle pairs
for partA = N
    energy = 0;
    for partB = 1:N
        if partB == partA
        continue
        else

        % compute distance
        r = whole_lattice(:,partA) - whole_lattice(:,partB);
        
        rnew = r;
        
        
        
        for component = 1:3    %minimum image criterion
            if rnew(component) > L/2
                rnew(component) = rnew(component) - L;
            elseif r(component) < -L/2
                rnew(component) = rnew(component) + L;
            end
        end
        

        r_2 = sum(dot(rnew,rnew));


        invr_6 = 1.0/(r_2^3); % 1/r^6
        pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
        
        %disp('[partA partB r_2 pairwise_energy]')
        %[partA partB r_2 pairwise_energy]
        energy = energy + pairwise_energy; % add to energy variable
        end

    end
    computed_energies(partA) = energy*4; %multiply by 4 after all energies between particles calculated
end
computed_energies = 1/2*sum(computed_energies);
end