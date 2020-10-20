%% BIOE464 Monte Carlo Project
clear all
clc
clf

%% Initialize Constant Parameters
N = 500;                %number of particles
T = [0.9 2.0];          %temperature values in reduced units
beta = 1./(T);       %beta in reduced units
density = 0.1:0.1:0.8;    %different densities
Nstep = 20;             %simulation steps

%% Monte Carlo Test with One Density, One Temp
rho = density(5);    %density of 0.5
b = beta(1);         %with T = 0.9
Lcube = (N/rho)^(1/3);   %determine length of side of cubic lattice (L = 10 here)

% Create initial particle values
initial_coords = create_coords(N,Lcube);  %create coordinates of particles
initial_energies = compute_E(initial_coords,0);   %compute energies of particles

for trial = 1:Nstep
    for particle = 1:N
        if trial == 1 & particle == 1
            % Assign all initial particle values to current variables of
            % all aprticles
            all_current_coords = initial_coords(:,:);
            all_current_energies = initial_energies(:,:);
        end
        
        % Assign initial particle position and energy of single particle
        particle_position = all_current_coords(:,particle);
        particle_energy = all_current_energies(:,particle);
        
        % Simulate proposed movement of single particle
        proposed_movement = particle_position + (rand(3,1));
        
        % Check to see if proposed movement is within periodic boundary
        % conditions and not overlapping any other particle
        proposed_coords = all_current_coords(:,:);   %copies all current coordinates
        proposed_coords(:,particle) = proposed_movement;    %replaces initial particle position with proposed
        checked_proposed_coords = check_coords(proposed_coords,Lcube);    %check/correct for no particle overlap from moved particle
        
        proposed_movement = checked_proposed_coords(:,particle); %assign single proposed movement after checking it is valid
        proposed_energy = compute_E(checked_proposed_coords,particle);    %compute energy of single moved particle
       
        [updated_coord updated_energy] = accept_reject(particle_position, proposed_movement,particle_energy, proposed_energy, b);    %accept/reject based on Boltzmann factor
        
        all_current_coords(:,particle) = updated_coord; %updates matrix with all coordinates
        all_current_energies(:,particle) = updated_energy; %updates matrix with all energies
        
    end
    energies(trial) = sum(all_current_energies); %sums updated energies of each particle
end
figure(1)
plot(1:Nstep,energies)
ylim([-1000 max(energies)])
xlabel('Simulation Step')
ylabel('Potential Energy')
title('Plot of Potential Energy at T = 0.9 and Density = 0.5')
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