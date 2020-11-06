function computed_energy = compute_E(particle, whole_lattice,L)

% This function computes the energy of the moved particle with the all other particles
% and outputs it as computed_energy.

N = size(whole_lattice,2); % number of particles
% Loop over all distinct particle pairs
partA = particle;
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

    r_2 = dot(rnew,rnew);

    invr_6 = 1.0/(r_2^3); % 1/r^6
    pairwise_energy = (invr_6 * (invr_6 - 1)); % computes energy between pair
        
    energy = energy + pairwise_energy; % add to energy variable
    end

end
computed_energy = energy*4; %multiply by 4 after all energies between particles calculated

end