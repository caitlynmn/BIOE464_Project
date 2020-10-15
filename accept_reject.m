function
if
    %initial energry, change in energy and beta
    
    (rand < exp(-beta*deltaE)) = 1
                % Accept displacement move
    (rand > exp(-beta*deltaE)) = -1  
    % reject displacement move
    
    (-deltaE > 0) = 2
    % accept when old energy coordinates is less than new energy
    
     (-deltaE < 0) = -2  
     % reject when old energy coordinates are more than new energy
     
     coords(:,i) = rTrial;       % Update positions
                energy = energy + deltaE;   % Update energy
end