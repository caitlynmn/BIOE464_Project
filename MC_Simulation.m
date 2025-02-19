%% BIOE464 Monte Carlo Project, MC Simulation for Question 1
clear all   %comment out if taking from previous simulation
clc

%% Initialize Constant Parameters
N = 500;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
beta = 1./T;            %beta in reduced units
density = 0.1:0.1:0.8;    %different densities
Nstep = 200000;            %simulation steps

%% One Density, One Temp
rho = density(5);    
b = beta(2);         
L = (N/rho)^(1/3);   %determine length of side of cubic lattice

%% Create initial particle values for first simulation
% Comment out section if taking from previous simulation

initial_coords = create_coords(N,L);  %create coordinates of particles
initial_energies = compute_whole_lattice_E(initial_coords,L);   %compute energies of particles

%% Create initial particle values if taking from previous simulations
% Uncomment section if taking from previous simulation

% initial_coords = first_simulation_coords;
% initial_energies = first_simulation_energies;
% clear energies

%% MC Simulation
tic
for trial = 1:Nstep
    if trial == 1
        % Assign all initial particle values to current variables of all particles
        all_current_coords = initial_coords(:,:);
        all_current_energies = initial_energies(:,:);
    end

    % Assign initial particle position and energy of single particle
    particle = randi([1 N]);
    particle_position = all_current_coords(:,particle);
    particle_energy = all_current_energies(:,particle);

    % Simulate proposed movement of single particle
    proposed_coordinate_lattice = displace_particle(particle,all_current_coords,L);
    proposed_movement = proposed_coordinate_lattice(:,particle);
    
    % Find new energy of proposed movement
    proposed_energy = compute_E(particle,proposed_coordinate_lattice,L);
    
    % Accept/reject based on Boltzmann
    [updated_coord updated_energy] = accept_reject(particle_position, proposed_movement,particle_energy, proposed_energy, b);    %accept/reject based on Boltzmann factor

    % Update coords and energies for next particle
    all_current_coords(:,particle) = updated_coord; %updates matrix with all coordinates
    all_current_energies(:,particle) = updated_energy;
    
    energies(trial) = 1/2*sum(all_current_energies); %sums updated energies of each particle
end
toc

%% Plot from first simulation
% Comment out if taking from previous simulation

figure(1)
energies = [1/2*sum(initial_energies) energies];
plot([0 1:Nstep],energies)
xlabel('Simulation Step')
ylabel('Potential Energy')
title(['Plot of Potential Energy at T = ',num2str(1/b),' and Density = ',num2str(rho)])
%% Storing values from first simulation
% Comment out if taking from previous simulation
% 
first_simulation_energies = all_current_energies;
first_simulation_coords = all_current_coords;
first_simulation_tot_energies = energies;

%% Plot if taking from previous simulation
% Uncomment if taking from previous simulation

% figure(1)
% all_energies = [first_simulation_tot_energies energies];
% times = [0:length(first_simulation_tot_energies) + Nstep - 1];
% plot(times,all_energies)
% xlim([0 times(1,end)])
% xlabel('Simulation Step')
% ylabel('Potential Energy')
% title(['Plot of Potential Energy at T = ',num2str(1/b),' and Density = ',num2str(rho)])
%% Storing new values from previous simulation to be used in next simulation run
% Uncomment if taking from previous simulation
% 
% first_simulation_energies = all_current_energies;
% first_simulation_coords = all_current_coords;
% first_simulation_tot_energies = all_energies;

%% Save variables after reaching equilibrium
% Uncomment when system has reached equilibrium
% Change file names appropriately

% filename = 'dens_0.5_T_2.0.mat';
% save(filename)
% csvwrite('d_0.5_T_2.0_coords.txt',first_simulation_coords)
% csvwrite('d_0.5_T_2.0_energies.txt',first_simulation_tot_energies')