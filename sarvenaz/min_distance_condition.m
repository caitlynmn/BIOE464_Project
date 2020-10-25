function coordinates = min_distance_condition(coords,L)
%% This function currently not in use - doesn't run
% This function takes in the coordinates and determines if any distance is
% less than the minimum spacing of rc = 1. If so, the function returns 0
% for false in which it does not meet the condition of distance > rc = 1.
% If it does meet the condition, returns 1.

N = size(coords,2);
%condition = 1;
coordinates=zeros(3,1);
coordinates(:,(1:N))=coords(:,(1:N));
for partA = N
    for partB = 1:N
        if partB == partA
            continue
        else
            % compute distance
            r = coords(:,partA) - coords(:,partB);
            
            
            
            for component = 1:3   % minimum image criterion
                if abs(r(component,1)) < 1
                    if coords(component,partA)>0
                        coordinates(component,partA) = 1 + coordinates(component,partA);
                    end
                    if coords(component,partA)<0
                        coordinates(component,partA) = -1 + coordinates(component,partA);
                    end
                else
                    continue
                    
                end
            end           

            % distance squared
%            r_2 = sum(dot(r,r));

 %           if r_2 < 1
 %               condition = 0;
  %              break
   %         end
    %    end
    %    if condition == 0
     %       break
      %  end
%    if condition == 0
 %       break
        end
    end
end