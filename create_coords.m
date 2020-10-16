function coordinates = create_coords(N,L)

% This function creates and outputs randomly generated coordinates in the
% x, y, and z directions for each particle N.
% Coordinates are within the range of -L/2 to L/2.

for i = 1:N   %iterates for every particle
    %creates random coordinate for x, y, and z
    coordinates(:,i) = -L/2 + (L)*rand(3,1);  %adds new coordinate
end
