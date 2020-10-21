%% BIOE464 Monte Carlo Project
clear all
clc
clf

%% Initialize Constant Parameters
N = 500;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
beta = 1./(T);       %beta in reduced units
density = 0.1:0.1:0.8;    %different densities
time_for_equillibrium = [2 3 10 15 30 35 40 50;4 5 10 12 15 20 30 40]; %estimated time for each system to equilibriate,
%based on MC simulation with each system. each row is for each temperature and
% each column is for each density (rough estimate by eyesight and ~5
% simulations each)
%% Monte Carlo Simulation
for i = [1 2]           %iterate twice for two temperatures
    b = beta(i);        %assign beta
    for j = 1:length(density)
        %% Assigns trial parameters
        rho = density(j);
        V = N/rho;
        L = (V)^(1/3);   %determine length of side of cubic lattice
        
        %% Create initial particle values
        initial_coords = create_coords(N,L);  %create coordinates of particles
        initial_energies = compute_E(initial_coords,0);   %compute energies of particles
        
        Nstep = time_for_equillibrium(i,j);
        
        for trial = 1:Nstep
            for particle = 1:N
                if trial == 1 & particle == 1
                    % Assign all initial particle values to current variables of
                    % all particles
                    all_current_coords = initial_coords(:,:);
                    all_current_energies = initial_energies(:,:);
                end

                %% Assign initial particle position and energy of single particle
                particle_position = all_current_coords(:,particle);
                particle_energy = all_current_energies(:,particle);

                %% Simulate proposed movement of single particle
                proposed_movement = particle_position + (rand(3,1));

                %% Check to see if proposed movement is within periodic boundary conditions
                proposed_coords = all_current_coords(:,:);   %copies all current coordinates
                proposed_coords(:,particle) = proposed_movement;    %replaces initial particle position with proposed
                checked_proposed_coords = check_coords(proposed_coords,L);    %check/correct for no particle overlap from moved particle

                proposed_movement = checked_proposed_coords(:,particle); %assign single proposed movement after checking it is valid
                proposed_energy = compute_E(checked_proposed_coords,particle);    %compute energy of single moved particle

                %% Accept/Reject based on Boltzmann
                [updated_coord updated_energy] = accept_reject(particle_position, proposed_movement,particle_energy, proposed_energy, b);    %accept/reject based on Boltzmann factor
                
                %% Update coords and energy for next particle
                all_current_coords(:,particle) = updated_coord; %updates matrix with all coordinates
                all_current_energies(:,particle) = updated_energy; %updates matrix with all energies

            end
            %% Store energy for trial
            energies(trial) = sum(all_current_energies); %sums updated energies of each particle
        end
        %% Compute pressure for each density
        vir = compute_vir(initial_coords,all_current_coords,initial_energies,all_current_energies,Nstep);
        P(i,j) = rho/b + 1/3*vir/V;
    end
end

%% Plotting on regular scale
figure(1)
plot(density,P(1,:)')  %plots pressure at T = 0.9
hold on
plot(density,P(2,:)')  %plots pressure at T = 2.0
hold off
legend('T = 0.9','T = 2.0')
title('Plot of Pressure as a Function of Density')
xlabel('Density')
ylabel('Pressure')

%% Plotting on semilogy scale
figure(2)
semilogy(density,P(1,:)')  %plots pressure at T = 0.9
hold on
semilogy(density,P(2,:)')  %plots pressure at T = 2.0
hold off
legend('T = 0.9','T = 2.0')
title('Plot of Pressure as a Function of Density')
xlabel('Density')
ylabel('Pressure')