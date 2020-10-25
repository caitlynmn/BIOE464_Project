function computed_energy = compute_particle_E(particle, proposed_coordiantes,L)
% This function computes the energy for the proposed moved particle in
% respect to the other particles or their image

N = size(proposed_coordiantes,2); % number of particles
% Loop over all distinct particle pairs
partA = particle;
energy = 0;
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
    r_2 = sum(dot(r,r));

    invr_6 = 1.0/(r_2^3); % 1/r^6
    pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
    energy = energy + pairwise_energy; % add to energy variable
    end

end
computed_energy = energy*4; %multiply by 4 after all energies between particles calculated
end 