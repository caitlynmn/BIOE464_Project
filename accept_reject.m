function [current_coordinates current_energies] = accept_reject(current_coordinates, corrected_moved_particles,current_energies, proposed_energies, b)

for i= [1 10] %iterate for every particle 
    
a= exp(b*-oldE)
b= exp(b*newE)

if (a<b) %accept displacement move
    
   %if accepting move then update position, if rejecting then keep old
   %position array 
   
   % need an output
     
     coords(:,i) = rTrial;       % Update positions
               % energy = energy + deltaE;   % Update energy
    end
end