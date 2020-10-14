function checked_coordinates = check_coords(coordinates,Ncube)

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