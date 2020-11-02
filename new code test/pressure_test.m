%% BIOE464 Monte Carlo Project
clear all
clc
clf

%% Initialize Constant Parameters
density = 0.1:0.1:0.6;    %different densities
T = [0.9 2.0];
time_for_equilibrium = 10^5 .* [4.5 4.5 5 8 10 14; 0.3 0.2 0.2 0.1 0.5 1.5];

%% Extract Data from Compiled Simulation Data
coord_file_names = {'T_0.9_coords.txt', 'T_2.0_coords.txt'};
energy_file_names = {'T_0.9_energies.txt', 'T_2.0_energies.txt'};

for temp_index = [1 2]          %iterate twice for two temperatures
    b = 1/T(temp_index);        %assign beta
    j = 1;
    compiled_coords = csvread(coord_file_names{temp_index});
    compiled_energies = csvread(energy_file_names{temp_index});
    for i = 1:length(density)
        rho = density(i);
        tot_time = time_for_equilibrium(temp_index,i);
        
        final_coords = compiled_coords(j:j+2,:);
        
        initial_energy = compiled_energies(1,i);
        
        final_energy = compiled_energies(tot_time,i);
        
        vir = compute_vir(final_coords,initial_energy,final_energy,tot_time);
        P(temp_index,i) = rho/b + 1/3*vir/(500/rho);
        
        j = j + 3;
    end
end
figure(1)
plot(density,P(1,:)');
title('Pressure vs Density for T = 0.9')
xlabel('Density')
ylabel('Pressure')

figure(2)
plot(density,P(2,:)');
title('Pressure vs Density for T = 2.0')
xlabel('Density')
ylabel('Pressure')