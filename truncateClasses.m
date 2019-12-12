function [outputFeatures,outputLabels]=truncateClasses(classA,classB)

%--------------------------------------------------------------------------
 % truncateClasses

 % Last updated: December 2019, J. LaRocco

 % Details: A program that truncates two unbalanced classes, to prevent bias.
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

totalLim=min([sizeA,sizeB]);
classA=classA([1:totalLim],:);
classB=classB([1:totalLim],:);
%% class balance

featuresBase=[classA; classB];

%% randomize order
labelsBase=[zeros(1,size(classA,1)) ones(1,size(classB,1))];

newOrder=randperm(size(featuresBase,1));
outputFeatures=featuresBase(newOrder,:);
outputLabels=labelsBase(newOrder);


end
