function [checked_coordinates count] = check_coords(coordinates,Ncube)

count = 0;
checked_coordinates = coordinates(:,:);
[uniques,I,J] = unique(checked_coordinates', 'rows', 'first');
hasDuplicates = size(uniques,1) < size(checked_coordinates',1);
ixDupRows = setdiff(1:size(checked_coordinates',1), I);

while length(ixDupRows) >= 1
    randomx = randi([-Ncube/2 Ncube/2]);
    randomy = randi([-Ncube/2 Ncube/2]);
    randomz = randi([-Ncube/2 Ncube/2]);
    checked_coordinates(:,ixDupRows(1)) = [randomx randomy randomz]';
    count = count + 1;
    [uniques,I,J] = unique(checked_coordinates', 'rows', 'first');
    hasDuplicates = size(uniques,1) < size(checked_coordinates',1);
    ixDupRows = setdiff(1:size(checked_coordinates',1), I);
end