function
if
    (rand < exp(-beta*deltaE))=1
                % Accept displacement move
    (rand > exp(-beta*deltaE)) =-1
    % Reject displacement move
                coords(:,i) = rTrial;       % Update positions
                energy = energy + deltaE;   % Update energy
            end