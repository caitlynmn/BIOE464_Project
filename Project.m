%% BIOE464 Monte Carlo Project
clear all
clc
clf

%% Initialize Constant Parameters
N = 10;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
k = 1.380649*10^(-23);  %botlzmann constant
beta = 1./(k.*T);         %beta in reduced units
density = 0.1:0.1:1;    %different densities

%% Monte Carlo Test with One Density, One Temp
rho = density(1);
b = beta(1);
L = (N/rho)^(1/3);   %determine length of side of cubic lattice
Lcube = round(L);    %round length to nearest whole integer
if mod(Lcube, 2) ~= 0  %round length to nearest even integer
    Lcube = Lcube + 1;
end

coords = create_coords(N,Lcube);  %create coordinates of particles
corrected_coords = check_coords(coords,Lcube);    %check/correct for no particle overlap
initial_energies = compute_E(corrected_coords);   %compute energies of particles

current_coordinates = corrected_coords(:,:);
current_energies = initial_energies(:,:);

tic;
for k = 1:1000

% if k == 1
%     moved_particles = create_coords(N,Lcube);
% else
    for particle = 1:N
        moved_particles(:,particle) = current_coordinates(:,particle) + (rand(3,1)); %create new coordinates of particles 
    end
% end

corrected_moved_particles = check_coords(moved_particles,Lcube);    %check/correct for no particle overlap
proposed_energies = compute_E(corrected_moved_particles);    %compute energies of moved particles

[current_coordinates current_energies] = accept_reject(current_coordinates, corrected_moved_particles,current_energies, proposed_energies, b);    %accept/reject based on Boltzmann factor
current_coordinates = check_coords(current_coordinates,Lcube);
energies(k) = sum(current_energies);
t(k) = toc;
end
plot(1:1000,energies)
xlabel('Simulation Step')
ylabel('Potential Energy')
title('Plot of Potential Energy at T = 0.9 and Density = 0.1')
%% Monte Carlo Simulation
% for i = [1 2]           %iterate twice for two temperatures
%     b = beta(i);        %assign beta
%     for j = 1:10
%         rho = density(j);
%         L = (N/rho)^(1/3);   %determine length of side of cubic lattice
%         Lcube = round(L);    %round length to nearest whole integer
%         if mod(Lcube, 2) ~= 0  %round length to nearest even integer
%             Lcube = Lcube + 1;
%         end
% 
%         coords = create_coords(N,Lcube);  %create coordinates of particles
%         corrected_coords = check_coords(coords,Lcube);    %check/correct for no particle overlap
%         initial_energies = compute_E(corrected_coords);   %compute energies of particles
%         
%         current_coordinates = corrected_coords(:,:);
%         current_energies = initial_energies(:,:);
%         
%         hold on
%         for k = 1:1000
%         rho = density(j);
%         tic;
%         
%         for particle = 1:N
%             moved_particles(:,particle) = current_coordinates(:,particle) + (rand(3,1)); %create new coordinates of particles 
%         end
%         
%         corrected_moved_particles = check_coords(moved_particles,Lcube);    %check/correct for no particle overlap
%         proposed_energies = compute_E(corrected_moved_particles);    %compute energies of moved particles
%         
%         [current_coordinates current_energies] = accept_reject(current_coordinates, corrected_moved_particles,current_energies, proposed_energies, b);    %accept/reject based on Boltzmann factor
%         current_coordinates = check_coords(current_coordinates,Lcube);
%         t(k) = toc;
%         plot(t,sum(current_energies))
%         end
%         hold off
%     end
% end

%% Plotting
% P(i,j) = rho/b + 1/3*sum(sum(current_energies.*(current_coordinates - corrected_coords)))/(N/rho);    %calculate pressure
% plot(0.1:0.1:1,P(1,:)')
% hold on
% plot(0.1:0.1:1,P(2,:)')
% hold off
% legend('T = 0.9','T = 2.0')
% title('Plot of Pressure as a Function of Density')
% xlabel('Density')
% ylabel('Pressure')