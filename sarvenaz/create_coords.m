function coordinates = create_coords(N,L)

% This function creates and outputs randomly generated coordinates in the
% x, y, and z directions for each particle N and ensures no overlap.
% Coordinates are within the range of -L/2 to L/2.

coordinates(:,1) = -L/2 + (L)*rand(3,1);  %adds new coordinate

for i = 2:N   %iterates for every particle
    %creates random coordinate for x, y, and z

    coordinates(:,i) = -L/2 + (L)*rand(3,1);  %adds new coordinate
%     rc_condition = min_distance_condition(coordinates,L);   %doesn't run
%     if uncommented, but it checks that each particle has a min distance
%     of rc = 1

    [uniques,I,J] = unique(coordinates', 'rows', 'first');    % find unique coordinates
    duplicaterows = setdiff(1:size(coordinates',1), I);       % find duplicate row indices

     rc_condition = min_distance_condition(coordinates,L);   % requires min distance of rc = 1
 %   rc_condition = 1;  %just put this here so it runs when rc condition is commented out

    while rc_condition == 0 || length(duplicaterows) >= 1
        coordinates(:,i) = -L/2 + (L)*rand(3,1);  %adds new coordinate
        [uniques,I,J] = unique(coordinates', 'rows', 'first');    % find unique coordinates
        duplicaterows = setdiff(1:size(coordinates',1), I);       % find duplicate row indices
        rc_condition = min_distance_condition(coordinates,L);
        if rc_condition == 0 || length(duplicaterows) >= 1
            break
        end
    end

end 