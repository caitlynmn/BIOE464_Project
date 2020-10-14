    clear all; close all;
    
    % ===================
    %     Initialize
    % ===================
    
    % Set configuration parameters
    nPart = 500;        % Number of particles
    density = 0.85;     % Density of particles
    
    % Set simulation parameters
    Temp = 2.0;         % Simulation temperature
    beta = 1.0/Temp;    % Inverse temperature
    maxDr = 0.1;        % Maximal displacement
    
    nSteps = 100;     % Total simulation time (in integration steps)
    printFreq = 100;    % Printing frequency
    
    % Set initial configuration
    [coords L] = initCubicGrid(nPart,density);
    
    % Calculate initial energy
    energy = LJ_Energy(coords,L);
    
    
    % ==============
    % MC Simulation
    % ==============
    for step = 1:nSteps
        
        if (mod(step,printFreq)==0)
            step
        end
        
        % each MC step involves suggesting nPart trial moves 
        
        for i=1:nPart
            % Suggest a trial move for particle i
            rTrial = coords(:,i) + maxDr*(rand(3,1)-0.5);
                
            % Apply periodic boundary conditions
            rTrial = PBC3D(rTrial,L);
          
            % Calculate the change in energy due to this trial move
            deltaE = LJ_EnergyChange(coords,rTrial,i,L);
    
            if (rand < exp(-beta*deltaE))
                % Accept displacement move
                coords(:,i) = rTrial;       % Update positions
                energy = energy + deltaE;   % Update energy
            end
        end
        
    end