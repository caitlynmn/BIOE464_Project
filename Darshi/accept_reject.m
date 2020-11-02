function [update_coord update_energy] = accept_reject(initial_coord,proposed_coord,initialE,proposedE,beta)
% disp('---------------------------------------------------------------------------------')
exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*proposedE);
random = rand;
exp_deltaE = exp(-beta*(proposedE-initialE));
% disp(['oldE: ',num2str(initialE),'    newE: ',num2str(proposedE),'    random: ', num2str(random),'    exp_deltaE: ', num2str(exp_deltaE)])
if particleE < initialE
    update_coord = proposed_coord;
    update_energy = proposedE;
%     disp('ACCEPTED')
elseif random < exp(-beta*(proposedE-initialE))
    update_coord = proposed_coord;
    update_energy = proposedE;
%     disp('RANDOM ACCEPTANCE')
else
    update_coord = initial_coord;
    update_energy = initialE;
end
end