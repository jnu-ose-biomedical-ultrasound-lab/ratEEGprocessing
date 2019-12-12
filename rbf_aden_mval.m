function [mean_measures,mean_phi,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv]=rbf_aden_mval(subs,features,labels)

%--------------------------------------------------------------------------
 % RBF_ADEN_MVAL

 % Last updated: Sept 2013, J. LaRocco

 % Details: Single-classifier cross-validation with MAD for feature reduction and RBF for pattern recognition. 

 % Usage: [mean_measures,mean_phi,mean_aucroc,mean_accuracy,mean_sensitivity,mean_specificity,mean_acc2,mean_ppv,mean_npv]=lda_mad_xval(subs,features,labels)

 % Input: 
 %  subs: Number of subjects.  
 %  features: cell-based struct of features. 
 %  labels: cell-based struct of targets. 
 
 % Output: 
 %  mean_measures: output matrix of all averaged metrics
    % 1st row is mean phi
    % 2st row is mean Area Under ROC 
    % 3rd row is mean accuracy
    % 4th row is mean sensitivity
    % 5th row is mean specificity
    % 6th row is mean accuracy (calculated in different way than 3rd row, should be the same as value in 3rd row)
    % 7th row is mean ppv
    % 8th row is mean npv
    
%--------------------------------------------------------------------------

%features=psd_pca_sep_features;
 %labels=total_labels;
%need 210 x 5 for training, 30 x 5 for testing, 210 x 1 for labels
mean_measures=[]; 

a=1:subs;
for uu=1:subs;
test_sub=uu; 
arrays=a;
arrays(arrays==uu) = [];
train_sub=arrays;



num_subs=length(train_sub); 

testing_data=squeeze(features{test_sub});
[featurenums,instances]=size(testing_data);
    

training_data=[];
for rr=1:num_subs
    
training_data(:,:,rr)=(features{train_sub(rr)});

end
transdata=zeros(instances*num_subs,featurenums);
lobster=[];
for trd=1:num_subs
lobster=squeeze(training_data(:,:,trd));
transdata((((trd-1)*instances)+1):(trd*instances),1:featurenums)=lobster';
end
training_data=transdata;

testing_label=labels{test_sub}'; 

traininglabel=[];
for ii=1:num_subs
 traininglabel(:,ii)=labels{train_sub(ii)};
 
end

[dim1,dim2]=size(traininglabel);
training_label=reshape(traininglabel,dim1*dim2,1);

testing_data=testing_data';

%training_data=abs(training_data);
%testing_data=abs(testing_data);

%training_data=prototype_cleanup(training_data);
%testing_data=prototype_cleanup(testing_data);

 [w_csp,a_csp,training_csp,test_csp]=feature_selection_aden(training_data,training_label,testing_data,1);

% psd_csp_features{i}=w_csp;
% % 
%psd_csp_class1{i}=Z1;
% % 
%psd_csp_class2{i}=Z2;






[C]=prototype_rbf_default_classify(test_csp,training_csp,training_label);


%pattern recognition module

%ensemble module

%seven fold validation
%idea= for loop iteration determines subject used for testing


%okay, something's up with CSP. Or just our shitty dummy data. perhaps the
%dummy data. more complex data gave better results.
%EVERY SECOND MALIK USED 34x16 (feature x channel) EEG PSD MATRIX. channels
%shoved into same rows. 


[phi,roc,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv]=prototype_correction(C,testing_label);



mean_measures(:,uu)=[phi,auc_roc,accuracy,sensitivity,specificity,acc2,ppv,npv];    
    
end

mean_phi=mean(mean_measures(1,:));
mean_aucroc=mean(mean_measures(2,:));
mean_accuracy=mean(mean_measures(3,:));
mean_sensitivity=mean(mean_measures(4,:));
mean_specificity=mean(mean_measures(5,:));
mean_acc2=mean(mean_measures(6,:));
mean_ppv=mean(mean_measures(7,:));
mean_npv=mean(mean_measures(8,:));

end
