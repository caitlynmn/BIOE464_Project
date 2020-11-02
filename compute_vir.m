function calculated_vir = compute_vir(final_coords, init_E, final_E, dt)

% This function calculated vir needed for pressure by taking in the final
% coordinates of the particle, initial energy of the system, final energy
% of the system, and total time needed to reach equilibrium. The function
% then calculates the distanes between each particle, stores each distance
% as an array, then calculates vir by multiplying by f.

N = length(final_coords); % number of particles
du = final_E - init_E;
f = -du/dt;
for partA = 1:N
    distances = 0;
    for partB = 1:N
        if partB == partA
            continue
        else
        
        % compute distance vectors
        r = final_coords(:,partA) - final_coords(:,partB);
        
        % distance squared
        r_2 = sum(dot(r,r));
        
        %magnitude of distance
        r = sqrt(r_2);
        
        distances = distances + r;
        end
    end
    stored_distances(partA) = distances;  %sums distances for each particle pair of particle A
end
calculated_vir = 1/2*sum(f.*stored_distances); %divide by 2 to make sure not to double count distances