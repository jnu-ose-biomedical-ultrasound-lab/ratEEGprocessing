
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
[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_pca_mval(subs,features,labels,p);
xval.lda.pca.mean.acc=mean_accuracy; 
xval.lda.pca.mean.sens=mean_sensitivity; 
xval.lda.pca.mean.ppv=mean_ppv; 
xval.lda.pca.mean.phi=mean_phi;  
xval.lda.pca.mean.spec=mean_specificity; 
xval.lda.pca.mean.f1=mean_f1;  
xval.lda.pca.mean.kappa=mean_kappa; 
xval.lda.pca.mean.itr=mean_itr; 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_aden_mval(subs,features,labels,p);

xval.lda.aden.mean.acc=mean_accuracy; 
xval.lda.aden.mean.sens=mean_sensitivity; 
xval.lda.aden.mean.ppv=mean_ppv; 
xval.lda.aden.mean.phi=mean_phi;  
xval.lda.aden.mean.spec=mean_specificity; 
xval.lda.aden.mean.f1=mean_f1;  
xval.lda.aden.mean.kappa=mean_kappa; 
xval.lda.aden.mean.itr=mean_itr; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=lda_adenz_mval(subs,features,labels,p);
xval.lda.adenz.mean.acc=mean_accuracy; 
xval.lda.adenz.mean.sens=mean_sensitivity; 
xval.lda.adenz.mean.ppv=mean_ppv; 
xval.lda.adenz.mean.phi=mean_phi;  
xval.lda.adenz.mean.spec=mean_specificity; 
xval.lda.adenz.mean.f1=mean_f1;  
xval.lda.adenz.mean.kappa=mean_kappa; 
xval.lda.adenz.mean.itr=mean_itr; 
% 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=ada_aden_mval(subs,features,labels,p);

xval.adaboost.aden.mean.acc=mean_accuracy; 
xval.adaboost.aden.mean.sens=mean_sensitivity; 
xval.adaboost.aden.mean.ppv=mean_ppv; 
xval.adaboost.aden.mean.phi=mean_phi;  
xval.adaboost.aden.mean.spec=mean_specificity; 
xval.adaboost.aden.mean.f1=mean_f1;  
xval.adaboost.aden.mean.kappa=mean_kappa; 
xval.adaboost.aden.mean.itr=mean_itr; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=ada_adenz_mval(subs,features,labels,p);

xval.adaboost.adenz.mean.acc=mean_accuracy; 
xval.adaboost.adenz.mean.sens=mean_sensitivity; 
xval.adaboost.adenz.mean.ppv=mean_ppv; 
xval.adaboost.adenz.mean.phi=mean_phi;  
xval.adaboost.adenz.mean.spec=mean_specificity; 
xval.adaboost.adenz.mean.f1=mean_f1;  
xval.adaboost.adenz.mean.kappa=mean_kappa; 
xval.adaboost.adenz.mean.itr=mean_itr; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa,mean_itr]=ada_pca_mval(subs,features,labels,p);

xval.adaboost.pca.adenz.mean.acc=mean_accuracy; 
xval.adaboost.pca.adenz.mean.sens=mean_sensitivity; 
xval.adaboost.pca.adenz.mean.ppv=mean_ppv; 
xval.adaboost.pca.adenz.mean.phi=mean_phi;  
xval.adaboost.pca.adenz.mean.spec=mean_specificity; 
xval.adaboost.pca.adenz.mean.f1=mean_f1;  
xval.adaboost.pca.adenz.mean.kappa=mean_kappa; 
xval.adaboost.pca.adenz.mean.itr=mean_itr; 



[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svm_aden_mval(subs,features,labels,p);

xval.svm.aden.mean.acc=mean_accuracy; 
xval.svm.aden.mean.sens=mean_sensitivity; 
xval.svm.aden.mean.ppv=mean_ppv; 
xval.svm.aden.mean.phi=mean_phi;  
xval.svm.aden.mean.spec=mean_specificity; 
xval.svm.aden.mean.f1=mean_f1;  
xval.svm.aden.mean.kappa=mean_kappa; 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svm_adenz_mval(subs,features,labels,p);

xval.svm.adenz.mean.acc=mean_accuracy; 
xval.svm.adenz.mean.sens=mean_sensitivity; 
xval.svm.adenz.mean.ppv=mean_ppv; 
xval.svm.adenz.mean.phi=mean_phi;  
xval.svm.adenz.mean.spec=mean_specificity; 
xval.svm.adenz.mean.f1=mean_f1;  
xval.svm.adenz.mean.kappa=mean_kappa; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svm_pca_mval(subs,features,labels,p);

xval.svm.pca.mean.acc=mean_accuracy; 
xval.svm.pca.mean.sens=mean_sensitivity; 
xval.svm.pca.mean.ppv=mean_ppv; 
xval.svm.pca.mean.phi=mean_phi;  
xval.svm.pca.mean.spec=mean_specificity; 
xval.svm.pca.mean.f1=mean_f1;  
xval.svm.pca.mean.kappa=mean_kappa; 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svmp_aden_mval(subs,features,labels,p);

xval.svmp.aden.mean.acc=mean_accuracy; 
xval.svmp.aden.mean.sens=mean_sensitivity; 
xval.svmp.aden.mean.ppv=mean_ppv; 
xval.svmp.aden.mean.phi=mean_phi;  
xval.svmp.aden.mean.spec=mean_specificity; 
xval.svmp.aden.mean.f1=mean_f1;  
xval.svmp.aden.mean.kappa=mean_kappa; 


[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svmp_adenz_mval(subs,features,labels,p);

xval.svmp.adenz.mean.acc=mean_accuracy; 
xval.svmp.adenz.mean.sens=mean_sensitivity; 
xval.svmp.adenz.mean.ppv=mean_ppv; 
xval.svmp.adenz.mean.phi=mean_phi;  
xval.svmp.adenz.mean.spec=mean_specificity; 
xval.svmp.adenz.mean.f1=mean_f1;  
xval.svmp.adenz.mean.kappa=mean_kappa; 

[mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svmp_pca_mval(subs,features,labels,p);

xval.svmp.pca.mean.acc=mean_accuracy; 
xval.svmp.pca.mean.sens=mean_sensitivity; 
xval.svmp.pca.mean.ppv=mean_ppv; 
xval.svmp.pca.mean.phi=mean_phi;  
xval.svmp.pca.mean.spec=mean_specificity; 
xval.svmp.pca.mean.f1=mean_f1;  
xval.svmp.pca.mean.kappa=mean_kappa; 

end

