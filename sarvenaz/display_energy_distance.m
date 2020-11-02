clc
indices = find(energy > 0);
for i = 1:length(indices)
    index = indices(i);
    disp(['Energy: ', num2str(energy(index))])
    disp(['r: ',num2str(r(index))])
    disp('-------------')
end