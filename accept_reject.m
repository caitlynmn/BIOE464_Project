function [update_coord update_energy] = accept_reject(initial_coord,proposed_coord,initialE,proposedE,beta)

% This function takes in the particle's initial coordinates, proposed
% coordinates, initial energy, and proposed energy along with beta
% (calculated as 1/temperature) and accepts or rejects moves using the
% boltzmann factor of exp(-beta*energy)

exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*proposedE);
random = rand;
exp_deltaE = exp(-beta*(proposedE-initialE));
if proposedE < initialE
    update_coord = proposed_coord;
    update_energy = proposedE;
elseif random < exp(-beta*(proposedE-initialE))
    update_coord = proposed_coord;
    update_energy = proposedE;
else
    update_coord = initial_coord;
    update_energy = initialE;
end
end