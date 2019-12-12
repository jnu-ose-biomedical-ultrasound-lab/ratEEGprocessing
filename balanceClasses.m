function [outputFeatures,outputLabels]=balanceClasses(classA,classB)

%--------------------------------------------------------------------------
 % balanceClasses

 % Last updated: December 2019, J. LaRocco

 % Details: A program that balances two unbalanced classes, to prevent bias.
 % Usage:
 % [outputFeatures,outputLabels]=balanceClasses(classA,classB);

 % Input: 
 %  classA: 2D matrix of non-events (denoted by binary 0).  
 %  classB: 2D matrix of events (denoted by binary 1). 
 
 % Output: 
 %  outputFeatures: randomly reorganized, balanced data.
 %  outputLabels: randomly reorganized, balanced labels.

%--------------------------------------------------------------------------
sizeA=size(classA,1);
sizeB=size(classB,1);

%% class balance

if (sizeB > sizeA)
multiplierV=ceil(sizeB./sizeA);
newA=[];
for i=1:multiplierV
    newA=[newA; classA];
end
classA=newA([1:sizeB],:);

else
    multiplierVB=ceil(sizeA./sizeB);
newB=[];
for i=1:multiplierVB
    newB=[newB; classB];
end
classB=newA([1:sizeA],:);


end

featuresBase=[classA; classB];

%% randomize order
labelsBase=[zeros(1,size(classA,1)) ones(1,size(classB,1))];

newOrder=randperm(size(featuresBase,1));
outputFeatures=featuresBase(newOrder,:);
outputLabels=labelsBase(newOrder);


end
