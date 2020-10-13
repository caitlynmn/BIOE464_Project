function coordinates = create_coords(N,density)
Lsize = (N/density)^(1/3);

Ncube = round(Lsize)

for i = 1:N
    randomx = randi([0 Ncube*100000])/100000;
    randomy = randi([0 Ncube*100000])/100000;
    randomz = randi([0 Ncube*100000])/100000;
    coordinates(:,i) = [randomx randomy randomz]';
end
