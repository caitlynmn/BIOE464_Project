function [updated_coordinates updated_energy] = accept_reject(old_coords,proposed_coords,initialE,proposedE,beta)
exp_old = exp(-beta*initialE);
exp_proposed = exp(-beta*proposedE);

updated_coordinates = old_coords(:,:);
updated_energy = initialE(:,:);

for i = 1:length(initialE)
    if exp_proposed(i) > exp_old(i)
        updated_coordinates(i) = proposed_coords(i);
        updated_energy(i) = proposedE(i);
    elseif rand(1) < exp(-beta*(proposedE(i)-initialE(i)))
        updated_coordinates(i) = proposed_coords(i);
        updated_energy(i) = proposedE(i);
    end
end
end