function coordinates = create_coords(N,Ncube)

% This function creates and outputs randomly generated coordinates in the
% x, y, and z directions for each particle N.
% Coordinates are within the range of -Ncube/2 to Ncube/2.

for i = 1:N   %iterates for every particle
    %creates random coordinate for x, y, and z
    coordinates(:,i) = -Ncube/2 + (Ncube)*rand(3,1);  %adds new coordinate
end
