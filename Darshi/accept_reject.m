function [update_coord update_energy] = accept_reject(initial_coord,proposed_coord,initialE,particleE,beta)
% disp('---------------------------------------------------------------------------------')
exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*particleE);
random = rand;
exp_deltaE = exp(-beta*(particleE-initialE));
% disp(['oldE: ',num2str(initialE),'    newE: ',num2str(particleE),'    random: ', num2str(random),'    exp_deltaE: ', num2str(exp_deltaE)])
if particleE < initialE
    update_coord = proposed_coord;
    update_energy = particleE;
%     disp('ACCEPTED')
elseif random < exp(-beta*(particleE-initialE))
    update_coord = proposed_coord;
    update_energy = particleE;
%     disp('RANDOM ACCEPTANCE')
else
    update_coord = initial_coord;
    update_energy = initialE;
end
end