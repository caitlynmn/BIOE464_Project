function [update_coord update_energy] = accept_reject(initial_coord,proposed_coord,initialE,proposedE,beta)
exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*proposedE);
random = rand;
if exp_proposed > exp_old
    update_coord = proposed_coord;
    update_energy = proposedE;
elseif random < exp(-beta*(proposedE-initialE))
    update_coord = proposed_coord;
    update_energy = proposedE;
    disp('accepted otherwise')
else
    update_coord = initial_coord;
    update_energy = initialE;
end
end