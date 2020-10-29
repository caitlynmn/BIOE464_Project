function condition = min_distance_condition(particle,coords,L)
% This function takes in the coordinates and determines if any distance is
% less than the minimum spacing of rc = 1. If so, the function returns 0
% for false in which it does not meet the condition of distance > rc = 1.
% If it does meet the condition, returns 1.

N = size(coords,2);
condition = 1;
for partA = particle
    for partB = 1:N
        if partB == partA
            continue
        else
            % compute distance
            r = coords(:,partA) - coords(:,partB);
            
            for component = 1:3    %minimum image criterion
                if r(component) > L/2
                    r(component) = r(component) - L;
                elseif r(component) < -L/2
                    r(component) = r(component) + L;
                end
            end
            
%             for component = 1:3
%                 if abs(r(component)) < 1
%                     condition = 0;
%                     break
%                 end
%             end
%             
            r_2 = sum(dot(r,r));
            
            if sqrt(r_2) < 1
                condition = 0;
                break
            end
        end
        if condition == 0
            break
        end
    if condition == 0
        break
    end
    end
end
end