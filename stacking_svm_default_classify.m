function [ypred,outprobs]=stacking_svm_default_classify(testing,training,group)

%--------------------------------------------------------------------------
 % PROTOTYPE_SVM_CLASSIFY

 % Last updated: June 2013, J. LaRocco

 % Details: SVM-G classification function. 
 
 % Usage:
 % [ypred,outprobs]=stacking_svm_default_classify(testing,training,group)
 
 % Input: 
 %  testing: Testing data.   
 %  group: Training labels. 
 %  training: Training data.  
 
 % Output: 
 %  ypred: Rounded outputs.   
 %  outprobs: Raw outputs. 
 
%--------------------------------------------------------------------------



% 

c = 10;
epsilon = .000001;
kerneloption= 1;
kernel='gaussian';
verbose = 0; %0=no data, 1=more info
group(group==0)=-1;
%[xsup,w,b,pos]=svmclass(xapp,yapp,c,epsilon,kernel,kerneloption,verbose);
[xsup,w,b,pos]=svmclass(training,group,c,epsilon,kernel,kerneloption,verbose);
%ypred = svmval(xtest,xsup,w,b,kernel,kerneloption);
ypred = svmval(testing,xsup,w,b,kernel,kerneloption);
[ypred1,outprobs]=stacking_cleaning(ypred);
ypred=round(ypred);
ypred(ypred<=0)=0;
ypred(ypred>0)=1;

end

