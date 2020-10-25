function computed_energy = compute_particle_E(particle, proposed_coordiantes,L)
% This function computes the energy for the proposed moved particle in
% respect to the other particles or their image

N = size(proposed_coordiantes,2); % number of particles
% Loop over all distinct particle pairs
%partA = particle;
condition=1;
energy = 0;
energies=zeros(0,0);
for partA=N
    for partB = 1:N
        if partB == partA
            continue
        else
            % compute distance
            r = proposed_coordiantes(:,partA) - proposed_coordiantes(:,partB);
            
            for component = 1:3   % minimum image criterion
                if abs(r(component)) > L/2
                    r(component) = L/2 - r(component);
                end
            end
            % distance squared
            r_2 = sum(dot(r,r))
            if r_2 < 1
                condition = 0;
                break
            end
        if condition == 0
            break
        end
        if condition == 0
            break
        end  

       invr_6 = 1.0/(r_2^3); % 1/r^6
       pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
       energies(partB,1) = energy + pairwise_energy; % add to energy variable
        end
    end
end
computed_energy = energies*4; %multiply by 4 after all energies between particles calculated
end
