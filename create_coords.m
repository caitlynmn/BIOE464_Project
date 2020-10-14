function coordinates = create_coords(N,density)
L = (N/density)^(1/3);

Ncube = round(L)

for i = 1:N
    randomx = randi([-L/2 L/2]);
    randomy = randi([-L/2 L/2]);
    randomz = randi([-L/2 L/2]);
    coordinates(:,i) = [randomx randomy randomz]';
end
