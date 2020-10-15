function checked_coordinates = check_coords(coordinates,Ncube)

for particle = 1:length(coordinates)    %iterates over all particles
    for component = 1:3    %iterates over each particle's position coordinate
        if coordinates(component,particle) > Ncube/2   %checks if outside of lattice
            coordinates(component,particle) = coordinates(component,particle) - Ncube/2; %corrects
        elseif coordinates(component, particle) < Ncube/2
            coordinates(component,particle) = coordinates(component,particle) + Ncube/2;
        end
    end
end

checked_coordinates = coordinates(:,:);
[uniques,I,J] = unique(checked_coordinates', 'rows', 'first');
duplicaterows = setdiff(1:size(checked_coordinates',1), I);

while length(duplicaterows) >= 1
    randomx = randi([-Ncube/2 Ncube/2]);
    randomy = randi([-Ncube/2 Ncube/2]);
    randomz = randi([-Ncube/2 Ncube/2]);
    checked_coordinates(:,duplicaterows(1)) = [randomx randomy randomz]';
    [uniques,I,J] = unique(checked_coordinates', 'rows', 'first');
    hasDuplicates = size(uniques,1) < size(checked_coordinates',1);
    duplicaterows = setdiff(1:size(checked_coordinates',1), I);
end