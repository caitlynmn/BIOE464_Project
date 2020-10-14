%% BIOE464 Monte Carlo Project
clear all
clc

N = 500;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
k = 1.380649*10^(-23);  %botlzmann constant
beta = 1./(k.*T);         %beta in reduced units

for i = [1 2]           %iterate twice for two temperatures
    b = beta(i);        %assign beta
    for rho = 0.1:0.1:1 %iterate over difference densities
        L = (N/rho)^(1/3);   %determine length of side of cubic lattice
        Lcube = round(L);    %round length to nearest whole integer
        if mod(Lcube, 2) ~= 0  %round length to nearest even integer
            Lcube = Lcube + 1;
        end

        coords = create_coords(N,Lcube);  %create coordinates of particles
        corrected_coords = check_coords(coords,Lcube);    %check/correct for no particle overlap
        initial_energies = compute_E(corrected_coords);   %compute energies of particles
        
        moved_particles = create_coords(N,Lcube);    %create new coordinates of particles
        corrected_moved_particles = check_coords(moved_particles,Lcube);    %check/correct for no particle overlap
        proposed_energies = compute_E(corrected_moved_particles);    %compute energies of moved particles
        
        [new_coords new_E] = accept_reject(initial_energies, proposed_energies, b);    %accept/reject based on Boltzmann factor
        
        P(:,i) = rho/b + 1/3*sum(new_E*(new_coords - corrected_coords))/(N/rho);    %calculate pressure
    end
end

plot(0.1:0.1:1,P(:,1)')
hold on
plot(0.1:0.1:1,P(:,2)')
hold off
legend('T = 0.9','T = 2.0')
title('Plot of Pressure as a Function of Density')
xlabel('Density')
ylabel('Pressure')