function coordinates = create_coords(N,Ncube)

% This function creates and outputs randomly generated coordinates in the
% x, y, and z directions for each particle N.
% Coordinates are within the range of -Ncube/2 to Ncube/2.

for i = 1:N   %iterates for every particle
    %creates random coordinate for x, y, and z
    randomx = randi([-Ncube/2 Ncube/2]);
    randomy = randi([-Ncube/2 Ncube/2]);
    randomz = randi([-Ncube/2 Ncube/2]);
    coordinates(:,i) = [randomx randomy randomz]';  %adds new coordinate
end
