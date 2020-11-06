%% BIOE464 Monte Carlo Project, Plotting Pressures for Question 2
clear all
clc

%% Initialize Constant Parameters
density = 0.1:0.1:0.6;    %different densities
T = [0.9 2.0];            %different temperatures
time_for_equilibrium = 10^5 .* [4.5 4.5 5 8 10 14; 0.175 0.25 0.3 0.6 1.0 1.3];
% observed simulation steps needed for equilibrium for each simulation with
% first row being for T = 0.9 and second row for T = 2.0. Each column is
% for the different densities

%% Extract Data from Compiled Simulation Data
coord_file_names = {'T_09_coords.txt', 'T_20_coords.txt'};
energy_file_names = {'T_09_energies.txt', 'T_20_energies.txt'};

for temp_index = [1 2]          %iterate twice for two temperatures
    b = 1/T(temp_index);        %assign beta
    j = 1;
    compiled_coords = csvread(coord_file_names{temp_index});  %takes coords for simulations of temperature
    compiled_energies = csvread(energy_file_names{temp_index});   %takes energies for simulations of temperature
    for i = 1:length(density)
        rho = density(i);
        tot_time = time_for_equilibrium(temp_index,i);    %assigns total time for equil.
        
        final_coords = compiled_coords(j:j+2,:);    %takes final coords for simulation
        
        initial_energy = compiled_energies(1,i);    %takes first tot energy for simulation
        
        final_energy = compiled_energies(tot_time,i);  %takes final tot energy for simulation
        
        vir = compute_vir(final_coords,initial_energy,final_energy,tot_time);  %computes vir from vir function
        P(temp_index,i) = rho/b + 1/3*vir/(500/rho);   %computes pressure
        P_expected(temp_index,i)=rho/b;
        
        j = j + 3;
    end
end
figure(1)
plot(density,P(1,:)');
title('Pressure vs Density for T = 0.9')
xlabel('Density')
ylabel('Pressure')

hold on
plot(density,P_expected(1,:)');
legend("Calculated Pressure", "Expected Pressure=\rho / \beta","location", "southeast")
hold off

figure(2)
plot(density,P(2,:)');
title('Pressure vs Density for T = 2.0')
xlabel('Density')
ylabel('Pressure')

hold on
plot(density,P_expected(2,:)');
legend("Calculated Pressure", "Expected Pressure=\rho / \beta", "location", "southeast")
hold off

