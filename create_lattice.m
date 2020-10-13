function coordinates = create_coords(N,density)
Lsize = (N/density)^(1/3);

Ncube = 2;
while Ncube^3 < N
    Ncube = Ncube + 1;
end
Ncube

index = [0 0 0]';
for part = 1:N
    coordinates(:,part) = (index + [0.5 0.5 0.5]')*(Lsize/Ncube);
    index(1) = index(1) + 1;
    if index(1) == Ncube
        index(1) = 0;
        index(2) = index(2) + 1;
        if index(2) == Ncube
            index(2) = 0;
            index(3) = index(3) + 1;
        end
    end
end
end
