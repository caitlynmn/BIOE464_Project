function [current_coordinates current_energies] = accept_reject(current_coordinates, corrected_moved_particles,current_energies, proposed_energies, b)

i= [1 2];
b=beta(i); %assign beta

if
    %need input; initial energry, change in energy and beta
    
   (rand < exp(b*-oldE)) = 1
                % Accept displacement move 
               
elseif
                   (rand > exp(beta*newE)) = -1  
    % reject displacement move
   
   %if accepting move then update position, if rejecting then keep old
   %position array 
   
   % need an output
     
     coords(:,i) = rTrial;       % Update positions
               % energy = energy + deltaE;   % Update energy
    end
end