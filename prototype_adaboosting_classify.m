function [ypred,outprobs]=prototype_adaboosting_classify(testing,training,group,itt)


%--------------------------------------------------------------------------
 % PROTOTYPE_ADABOOSTING_CLASSIFY

 % Last updated: June 2013, J. LaRocco

 % Details: Adaboost classification function. 
 
 % Usage:
 % [ypred,outprobs]=prototype_adaboosting_classify(testing,training,group,itt)
 
 % Input: 
 %  testing: Testing data.   
 %  group: Training labels. 
 %  training: Training data.  
 %  itt: Number of weak learners/classifiers to use.  
 
 % Output: 
 %  ypred: Rounded outputs. 
 %  outprobs: Raw outputs.  
    
%--------------------------------------------------------------------------




%features=psd_pca_sep_features;
 %labels=total_labels;
%need 210 x 5 for training, 30 x 5 for testing, 210 x 1 for labels
% P= [1 2 3];
%T = [2.0 4.1 5.9];
%net = newrb(P,T);
%P = 1.5;
%Y = sim(net,P)
%itt=number of weak learners

P=training; 
T=group'; 
T(T==0)=-1;


P=cleanUp(P);
T=cleanUp(T);
P1=testing;
P1=cleanUp(P1);

[classestimate,model]=adaboost('train',P,T,itt);
Y=adaboost('apply',P1,model);


close all
close all hidden


%nboost=subs;
nboost=7;
weights=[];

%Y=sum(alpha(oro)*predict(c(oro),P1)); 
%Y = sim(net,P1);
outprobs=Y;
ypred=round(Y);
close all
close all hidden



ypred=round(ypred);
ypred(ypred<=0)=0;
ypred(ypred>=1)=1;


end

