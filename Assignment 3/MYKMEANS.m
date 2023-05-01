%% Shubham Daule (2787739)
% Assignment 03 
%%
function [clustermap, center, dist] = MYKMEANS(inputIm, K)
    
    [rows, columns, dim] = size(inputIm);
    inputIm = reshape(double(inputIm),rows*columns,3);
    
    center = inputIm(ceil(rand(K,1)*(rows*columns)),:);     
    labelDist   = zeros((rows*columns),K+2);                    
                                         
    for n = 1:10
       for i = 1:(rows*columns)
          for j = 1:K  
            labelDist(i,j) = norm(inputIm(i,:) - center(j,:));      
          end
          [dist, cl] = min(labelDist(i,1:K));               
          labelDist(i,K+1) = cl;                                
          labelDist(i,K+2) = dist;                          
       end
       for i = 1:K
          temprory = (labelDist(:,K+1) == i);                          
          center(i,:) = mean(inputIm(temprory,:));                     
          if sum(isnan(center(:))) ~= 0                    
             nc = find(isnan(center(:,1)) == 1);           
             for Ind = 1:size(nc,1)
             center(nc(Ind),:) = inputIm(randi(rows*columns),:);
             end
          end
       end
    end
    clustermap = reshape(labelDist(:,K+1),rows,columns);
end