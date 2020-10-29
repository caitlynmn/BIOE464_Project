function [update_coord update_energy] = accept_reject(initial_coord,proposed_coord,initialE,proposedE,beta)
disp('--------')
exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*proposedE);
random = rand;
exp_deltaE = exp(-beta*(proposedE-initialE));
disp(['initial E: ',num2str(initialE),'    proposed E: ',num2str(proposedE),'    exp_old: ',num2str(exp_old) ...
    ,'    exp_proposed: ',num2str(exp_proposed),'    exp_deltaE: ', num2str(exp_deltaE)])
if proposedE < initialE
    update_coord = proposed_coord;
    update_energy = proposedE;
elseif random < exp(-beta*(proposedE-initialE))
    update_coord = proposed_coord;
    update_energy = proposedE;
    disp('RANDOM ACCEPTANCE')
else
    update_coord = initial_coord;
    update_energy = initialE;
end
end