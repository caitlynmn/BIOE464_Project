function coordinates = create_coords(N,Ncube)

for i = 1:N
    randomx = randi([-Ncube/2 Ncube/2]);
    randomy = randi([-Ncube/2 Ncube/2]);
    randomz = randi([-Ncube/2 Ncube/2]);
    coordinates(:,i) = [randomx randomy randomz]';
end
