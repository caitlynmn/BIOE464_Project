function [new_coordinates new_energy] = accept_reject(oldcoords,proposedcoords,oldE,newE,beta)
eold = exp(-beta*oldE);
eproposed = exp(-beta*newE);
new_coordinates = oldcoords(:,:);
new_energy = oldE(:,:);
for i = 1:length(oldE)
    if eproposed(i) < eold(i)
        new_coordinates(i) = proposedcoords(i);
        new_energy(i) = newE(i);
    elseif rand(1) < exp(-beta*(newE(i)-oldE(i)))
        new_coordinates(i) = proposedcoords(i);
        new_energy(i) = newE(i);
    end
end
end