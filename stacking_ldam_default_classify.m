function [ypred1,outprobs]=stacking_ldam_default_classify(testing,training,group)

%--------------------------------------------------------------------------
 % STACKING_LDAM_DEFAULT_CLASSIFY

 % Last updated: June 2013, J. LaRocco

 % Details: LDA classification function. 
 
 % Usage:
 % [ypred1,outprobs]=stacking_ldam_classic_classify(testing,training,group)
 
 % Input: 
 %  testing: Testing data.   
 %  group: Training labels. 
 %  training: Training data.  
 
 % Output: 
 %  ypred1: Rounded outputs.   
 %  outprobs: Raw outputs. 
 
%--------------------------------------------------------------------------



trainSamples=training;
testSamples=testing;
training_label1=group;

[observations,vecs]=size(training_label1);
trainClasses=[];
for uu=1:observations
trainClasses{uu}=training_label1(uu,1);

end



%trainClasses=mat2cell(training_label1); 

%mLDA = LDA(trainSamples, trainClasses);
%mLDA.Compute();

%dimension of a samples is < (mLDA.NumberOfClasses-1) so following line cannot be executed:
%transformedSamples = mLDA.Transform(meas, mLDA.NumberOfClasses - 1);

%transformedTrainSamples = mLDA.Transform(trainSamples, 1);
%transformedTestSamples = mLDA.Transform(testSamples, 1);

%************************* MultiClass LDA ***************************************

%calculatedClases = knnclassify(transformedTestSamples, transformedTrainSamples, trainClasses);

%calculatedClasses = classify(transformedTestSamples, transformedTrainSamples, group);
%[calculatedClasses,err,P,logp,coeff] =classify(transformedTestSamples, transformedTrainSamples, group);
[calculatedClasses,err,P,logp,coeff]=classify(testSamples, trainSamples, group);
C=round(calculatedClasses);

%err=transformedTestSamples;
%P=calculatedClasses;
%logp=log(transformedTrainSamples);
%coeff=transformedTrainSamples;


%[C,err,P,logp,coeff] = classify(testing,training,group,'linear');

[ypred1,outprobs]=stacking_cleaning(C);

end
%gscatter(X,Y,C,'rb','.',1,'off');

%[C,err,P,logp,coeff] = classify([X Y],[SL SW],group,'linear');

