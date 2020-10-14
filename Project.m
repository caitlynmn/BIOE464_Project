%% BIOE464 Monte Carlo Project
clear all
clc

N = 500;

rho = 0.85;
L = (N/rho)^(1/3);
Lcube = round(L);
if mod(Lcube, 2) ~= 0
    Lcube = Lcube + 1;
end

coords = create_coords(N,Lcube);

[corrected_coords corrections] = check_coords(coords,Lcube);

corrections