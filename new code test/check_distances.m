function distances = check_distances(whole_lattice, L)
%% FUNCTION TO CHECK DISTANCES TO CONFIRM INITIAL LATTICE SET UP

N = size(whole_lattice,2); % number of particles

for partA = 1:N
    energy = 0;
    for partB = 1:N
        if partB == partA
        continue
        else

        % compute distance
        r = whole_lattice(:,partA) - whole_lattice(:,partB)

        % distance squared
        r_2 = sum(dot(r,r));
        
        distances(partA,partB) = r_2;
        end
    end
end
end