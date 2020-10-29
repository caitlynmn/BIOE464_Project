function distances = check_distances(whole_lattice, L)

N = size(whole_lattice,2); % number of particles

for partA = N
    energy = 0;
    for partB = 1:N
        if partB == partA
        continue
        else

        % compute distance
        r = whole_lattice(:,partA) - whole_lattice(:,partB);
        
%         for component = 1:3    %minimum image criterion
%             if abs(r(component)) > L/2
%                 r(component) = L/2 - r(component);
%             end
%         end

        % distance squared
        r_2 = sum(dot(r,r));
        
        distances(partA,partB) = r_2;
        end
    end
end
end