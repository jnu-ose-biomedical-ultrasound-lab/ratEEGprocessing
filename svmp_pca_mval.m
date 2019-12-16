function [mean_measures,mean_phi,mean_phiclassic,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv,mean_f1,mean_kappa]=svmp_pca_mval(subs,features,labels,pvalue)

%--------------------------------------------------------------------------
 % SVM_PCA_MVAL

 % Last updated: April 2014, J. LaRocco

 % Details: Single classifier with PCA for feature reduction and SVM for pattern recognition.

 % Usage: [mean_measures,mean_phi,mean_phiclassic,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc_sns,mean_acc2,mean_ppv,mean_npv]=svm_pca_mval(subs,features,labels,pvalue)

 % Input:
 %  subs: Number of subjects.
 %  features: cell-based struct of features.
 %  labels: cell-based struct of targets.
  %  pvalue: features to reduce to.



 % Output:
 %  mean_measures: output matrix of all averaged metrics
    % 1st row is mean phi
    % 2st row is mean phi by other means
    % 3rd row is mean accuracy
    % 4th row is mean sensitivity
    % 5th row is mean specificity
    % 6th row is mean accuracy (mean of sensitivity and specificity)
    % 7th row is mean accuracy (calculated in different way than 3rd row, should be the same as value in 3rd row)
    % 8th row is mean ppv
    % 9th row is mean npv

%--------------------------------------------------------------------------



%psd_pca_sep_features;
%subs=8;

%need 210 x 5 for training, 30 x 5 for testing, 210 x 1 for labels
% P= [1 2 3];
%T = [2.0 4.1 5.9];
%net = newrb(P,T);
%P = 1.5;
%Y = sim(net,P)

mean_measures=[];

a=1:subs;
rongo=[];
tupara=[];
ruru=[];


for vv=1:subs
test_sub=vv;
testing_data=squeeze(features{test_sub});

testing_label=labels{test_sub}';

arrays1=a;
arrays1(arrays1==vv) = [];

train_sub=arrays1;
num_subs=length(train_sub);

AA = [];
for uu=1:num_subs;


trainingdata=squeeze(features{train_sub(uu)});

traininglabel=labels{train_sub(uu)}';

[pcs,newf,var_exp,newf2,tot_var_explained,N2]=feature_selection_pca_alt(trainingdata',testing_data',pvalue);
reduced_features=newf2;
mod_test=N2;


dispstr=sprintf('Running validation subject %s through model %s', num2str(vv), num2str(train_sub(uu)));
        disp(dispstr);

%CSP
%[w_csp,a_csp,training_csp,test_csp]=feature_selection_csp(reduced_features,training_label,mod_test);
traininglabel=traininglabel';
[ypre,clas_err]=stacking_svm_poly_classify(mod_test,reduced_features,traininglabel');
% [ypre,clas_err]=stacking_svm_default_classify(mod_test,reduced_features,traininglabel');
%bl=traininglabel+1;
%LDA_model = lda_malik2(newf2,bl);
%[c,clas_err] = classify2(LDA_model,N2);

 altout = clas_err*(1/(subs-1));
AA = [AA altout];

end
 AltModelOut = sum(AA,2);

    AltModelOutBin = zeros(1,length(AltModelOut));
     AltModelOutBin(find(AltModelOut>0.5)) = 1;
    AltModelOutBin(find(AltModelOut<0.4999)) = 0;
   % [phi,phiclassic,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv]=prototype_correction_malik(AltModelOutBin,testing_label);
[phi,phiclassic,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv,f1,kappa,itr]=correctBinaryOutputs(AltModelOutBin,testing_label);

%mean_measures(:,vv)=mean(tupara');

% mean_measures(:,vv)=[phi,phiclassic,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv];

mean_measures(:,vv)=[phi,phiclassic,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv,f1,kappa,itr];
end
mean_phi=mean(mean_measures(1,:));
mean_phiclassic=mean(mean_measures(2,:));
mean_aucroc=mean(mean_measures(3,:));
mean_accuracy=mean(mean_measures(4,:));
mean_sensitivity=mean(mean_measures(5,:));
mean_specificity=mean(mean_measures(6,:));
mean_acc2=mean(mean_measures(7,:));
mean_ppv=mean(mean_measures(8,:));
mean_npv=mean(mean_measures(9,:));
mean_f1=mean(mean_measures(10,:));
mean_kappa=mean(mean_measures(11,:));


end
