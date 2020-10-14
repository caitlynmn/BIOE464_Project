%% BIOE464 Monte Carlo Project
clear all
clc

N = 500;
T = [0.9 2.0];
k = 
beta = 1/(k*T);

for i = [1 2]
    b = beta(i);
    for rho = 0.1:0.1:1
        L = (N/rho)^(1/3);
        Lcube = round(L);
        if mod(Lcube, 2) ~= 0
            Lcube = Lcube + 1;
        end

        coords = create_coords(N,Lcube);
        corrected_coords = check_coords(coords,Lcube);
        initial_energies = compute_E(corrected_coords);
        
        moved_particles = create_coords(N,Lcube);
        corrected_moved_particles = check_coords(moved_particles,Lcube);
        
        deltaE = compute_deltaE(corrected_coords,corrected_moved_particles);
        
        [new_coords new_E] = accept_reject(initial_energies, initial_energies + deltaE, b)
        
        P(:,i) = rho/beta + 1/3*sum(new_E)*(new_coords - corrected_coords);
    end
end

plot(0.1:0.1:1,P(:,1)')
hold on
plot(0.1:0.1:1,P(:,2)')
hold off
legend('T = 0.9','T = 2.0')