
function xval=comparisonTests(features,labels,subs,p,fs)

%--------------------------------------------------------------------------
 % comparisonTests

 % Last updated: April 2019, J. LaRocco

 % Details: A program that takes and randomly reorders feature data from several subjects. Testing is still performed on a subject it has not seen before.  
 % Usage:
 % xval=comparisonTests(features,labels,subs,p,fs);

 % Input: 
 %  subs: Number of subjects.  
 %  features: cell-based struct of features. 
 %  labels: cell-based struct of targets. 
 %  p: positive integer number of features.
 %  fs: positive integer sampling frequency. 
 
 % Output: 
 %  xval: a struct containing the performance results. 

%--------------------------------------------------------------------------

xval=[];
xval.p=p;
xval.fs=fs;
xval.subs=subs;

%timer
% pause
% System configurations
% [mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_pca_mval(subs,features,labels,p);
% 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_aden_mval(subs,features,labels,p);

xval.adaboost.aden.mean.acc=mean_accuracy; 
xval.adaboost.aden.mean.sens=mean_sensitivity; 
xval.adaboost.aden.mean.ppv=mean_ppv; 
xval.adaboost.aden.mean.phi=mean_phi;  
xval.adaboost.aden.mean.spec=mean_specificity; 
xval.adaboost.aden.mean.f1=mean_f1;  
xval.adaboost.aden.mean.kappa=mean_kappa; 
xval.adaboost.aden.mean.itr=mean_itr; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_adenz_mval(subs,features,labels,p);

xval.adaboost.adenz.mean.acc=mean_accuracy; 
xval.adaboost.adenz.mean.sens=mean_sensitivity; 
xval.adaboost.adenz.mean.ppv=mean_ppv; 
xval.adaboost.adenz.mean.phi=mean_phi;  
xval.adaboost.adenz.mean.spec=mean_specificity; 
xval.adaboost.adenz.mean.f1=mean_f1;  
xval.adaboost.adenz.mean.kappa=mean_kappa; 
xval.adaboost.adenz.mean.itr=mean_itr; 





end

