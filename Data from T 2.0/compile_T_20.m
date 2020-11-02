%% Compiling Data for T = 2.0
% This script was used to compile all the simulation data's coordinates and
% energies at different densities for temperature = 2.0. The final txt file
% of T_2.0_coords.txt has all the final particle coordinates at the end of
% the simulations and T_2.0_energies.txt has all the final energies at the
% end of the simulations.

% ****** Make sure working directory is in data folder with T = 2.0 to run code ******

clear all
clc

j = 1;
coord_data = {'d_0.1_T_2.0_coords.txt','d_0.2_T_2.0_coords.txt','d_0.3_T_2.0_coords.txt',...
    'd_0.4_T_2.0_coords.txt','d_0.5_T_2.0_coords.txt','d_0.6_T_2.0_coords.txt'};
energy_data = {'d_0.1_T_2.0_energies.txt','d_0.2_T_2.0_energies.txt','d_0.3_T_2.0_energies.txt',...
    'd_0.4_T_2.0_energies.txt','d_0.5_T_2.0_energies.txt','d_0.6_T_2.0_energies.txt'};

compiled_energies = zeros(300000,1);
for temp_index = 1:6
    current_coords = csvread(coord_data{temp_index});
    compiled_coords(j:j+2,:) = current_coords;
    
    current_energies = csvread(energy_data{temp_index});
    time = size(current_energies);
    compiled_energies(1:time(1),temp_index) = current_energies;
    
    j = j + 3;
end
csvwrite('T_20_coords.txt',compiled_coords)
csvwrite('T_20_energies.txt',compiled_energies)