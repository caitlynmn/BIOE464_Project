function calculated_vir = compute_vir(init_coords, final_coords, init_E, final_E, dt)
N = length(init_coords); % number of particles
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
calculated_vir = 1/3*(sum(f.*stored_distances));