%% open bci parsing
clear; clf; clc;
%OpenBCI Raw EEG Data
%Number of channels = 4
%Sample Rate = 200.0 Hz
%First Column = SampleIndex
%Last Column = Timestamp 

chanNum=4;
fs=200;

x=load('OpenBCI-RAW-2019-11-04_14-21-12.txt');

eeg=x(:,2:(chanNum+1));

eegB=eeg-mean(eeg);

fScale=linspace(1,(fs/2),ceil(fs/2));


%% filter eeg
N    = 30;     
Fc1  = 1;    
Fc2  = 45;    
flag = 'scale';  
win = blackman(N+1);
b  = fir1(N, [Fc1 Fc2]/(fs/2), 'bandpass', win, flag);
Hd = dfilt.dffir(b);
filteredEEG=filter(Hd,eegB);

%% bipolar conversion

beegB1=eegB(:,1:round(chanNum/2));
beegB2=eegB(:,(round(chanNum/2)+1):chanNum);
beegB=abs(beegB2-beegB1);
eegB=mean(beegB,2);


%% calculate power

% unfiltered
unfilteredPower=abs(pwelch(eegB,[],[],fScale,fs)); 
e1=10*log10(unfilteredPower);

% filtered
filteredEEG1=filteredEEG(:,1:round(chanNum/2));
filteredEEG2=filteredEEG(:,(round(chanNum/2)+1):chanNum);
bfilteredEEG=abs(filteredEEG1-filteredEEG2);
filteredEEG=mean(bfilteredEEG,2);
filteredPower=abs(pwelch(filteredEEG,[],[],fScale,fs)); 
e2=10*log10(filteredPower);


%% band powers
[uBp]=bandpowerPW(eegB,fs);
[fBp]=bandpowerPW(filteredEEG,fs);


%% plot figure
figure();
plot(fScale,e1);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,e2);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

%figure();
%plot(10*log10(uBp(1:12,:)));

%figure();
%plot(10*log10(fBp(1:12,:)))

%% load rat data

% session 1 is baseline/control
% session 2 is experimental

%% rat 1
% sess 1
r1=load('OpenBCI-RAW-2019-12-04_12-20-26.txt');
er1=r1(:,2:(chanNum+1));
er1=er1-mean(er1);
filteredEr1=filter(Hd,er1);
rangR=abs(max(filteredEr1)-min(filteredEr1));
bestChans=find(rangR==min(rangR));
%figure; plot(er1(1:(10*fs),:)); figure; plot(filteredEr1(1:(10*fs),:));

%filteredEr1B1=filteredEr1(:,1:round(chanNum/2));
%filteredEr1B2=filteredEr1(:,(round(chanNum/2)+1):chanNum);
%bfilteredEr1=abs(filteredEr1B1-filteredEr1B2);
%filteredEr1=mean(bfilteredEr1,2);
filteredEr1=filteredEr1(:,bestChans);
% sess 2
r2=load('OpenBCI-RAW-2019-12-04_13-12-58.txt');
er2=r2(:,2:(chanNum+1));
er2=er2-mean(er2);
filteredEr2=filter(Hd,er2);
%figure; plot(er2(1:(10*fs),:)); figure; plot(filteredEr2(1:(10*fs),:));

%filteredEr2B1=filteredEr2(:,1:round(chanNum/2));
%filteredEr2B2=filteredEr2(:,(round(chanNum/2)+1):chanNum);
%bfilteredEr2=abs(filteredEr2B1-filteredEr2B2);
%filteredEr2=mean(bfilteredEr2,2);
filteredEr2=filteredEr2(:,bestChans);

s1A=filteredEr1;
s1B=filteredEr2;

[paS1]=bandpowerPW(s1A,fs);
[pbS1]=bandpowerPW(s1B,fs);

filteredPowers1A=abs(pwelch(s1A,[],[],fScale,fs)); 
fs1A=10*log10(filteredPowers1A);
filteredPowers1B=abs(pwelch(s1B,[],[],fScale,fs)); 
fs1B=10*log10(filteredPowers1B);


%% rat 2
% sess 1
r1=load('OpenBCI-RAW-2019-12-04_14-31-55.txt');
er1=r1(:,2:(chanNum+1));
er1=er1-mean(er1);
filteredEr1=filter(Hd,er1);

rangR=abs(max(filteredEr1)-min(filteredEr1));
bestChans=find(rangR==min(rangR));
%figure; plot(er1(1:(10*fs),:)); figure; plot(filteredEr1(1:(10*fs),:));
%filteredEr1B1=filteredEr1(:,1:round(chanNum/2));
%filteredEr1B2=filteredEr1(:,(round(chanNum/2)+1):chanNum);
%bfilteredEr1=abs(filteredEr1B1-filteredEr1B2);
%filteredEr1=mean(bfilteredEr1,2);
filteredEr1=filteredEr1(:,bestChans);

% sess 2
r2=load('OpenBCI-RAW-2019-12-04_15-10-43.txt');
er2=r2(:,2:(chanNum+1));
er2=er2-mean(er2);

filteredEr2=filter(Hd,er2);
%filteredEr2B1=filteredEr2(:,1:round(chanNum/2));
%filteredEr2B2=filteredEr2(:,(round(chanNum/2)+1):chanNum);
%bfilteredEr2=abs(filteredEr2B1-filteredEr2B2);
%filteredEr2=mean(bfilteredEr2,2);
filteredEr2=filteredEr2(:,bestChans);
%figure; plot(er2(1:(10*fs),:)); figure; plot(filteredEr2(1:(10*fs),:));

s2A=filteredEr1;
s2B=filteredEr2;

[paS2]=bandpowerPW(s2A,fs);
[pbS2]=bandpowerPW(s2B,fs);

filteredPowers2A=abs(pwelch(s2A,[],[],fScale,fs)); 
fs2A=10*log10(filteredPowers2A);
filteredPowers2B=abs(pwelch(s2B,[],[],fScale,fs)); 
fs2B=10*log10(filteredPowers2B);
%% combine data
fA=[filteredPowers1A filteredPowers2A];
fB=[filteredPowers1B filteredPowers2B];

[h1,p1,ci1,stats1] = ttest2(filteredPowers1A,filteredPowers1B);
[h2,p2,ci2,stats2] = ttest2(filteredPowers2A,filteredPowers2B);
[h,p,ci,stats] = ttest2(fA,fB);

fA1=[fs1A fs2A];
fB1=[fs1B fs2B];

[h1,p1,ci1,stats1] = ttest2(fs1A,fs1B);
[h2,p2,ci2,stats2] = ttest2(fs2A,fs2B);
[h,p,ci,stats] = ttest2(fA1,fB1);

[h1,p1,ci1,stats1] = ttest2(paS1,pbS1);
[h2,p2,ci2,stats2] = ttest2(paS2,pbS2);
%[h,p,ci,stats] = ttest2([paS1; paS2; pbS1; pbS2]);
close all;

y=[paS1 paS2 pbS1 pbS2];
[p,tbl] = anova1(y)

%% plot figure
figure();
plot(fScale,fs1A);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,fs1B);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,fs2A);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,fs2B);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,abs(fs1B-fs1A));
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(fScale,abs(fs2B-fs2A));
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

figure();
plot(abs(pbS1-paS1));
xlabel('Frequency Features');
ylabel('Amplitude (dB)');

figure();
plot(abs(pbS2-paS2));
xlabel('Frequency Features');
ylabel('Amplitude (dB)');

%% cross validation
overlap=0.5;

% rat 1
[features1a]=featureWindowedPW(s1A,fs,overlap);
[features1b]=featureWindowedPW(s1B,fs,overlap);
labels1=[zeros(1,size(features1a,1)) ones(1,size(features1b,1))];
features1=[features1a; features1b];

lim1=min([size(features1a,1),size(features1b,1)]);
labelsB1=[zeros(1,lim1) ones(1,lim1)];
featuresB1=[features1a([1:lim1],:); features1b([1:lim1],:)];
newOrder=randperm(lim1);

f1ba=[features1a; features1a];

f1ba=features1a(newOrder,:);
f1bb=features1b(newOrder,:);
featuresB1=[f1ba f1bb];
featuresB1=reshape(featuresB1,[(2*lim1) , size(features1b,2)]);
%featuresB2=featuresB2(newOrder,:);
featuresB1=featuresB1(newOrder,:);
%labelsB1=labelsB1(newOrder);
labelsB1=[zeros(1,size(f1ba,1)) ones(1,size(f1bb,1))];
labelsB1=labelsB1(newOrder);

[featuresB1,labelsB1]=balanceClasses(features1a,features1b);
[featuresT1,labelsT1]=truncateClasses(features1a,features1b);

newOrder=randperm(size(features1,1));
features1=features1(newOrder,:);
labels1=labels1(newOrder);

% rat 2
[features2a]=featureWindowedPW(s2A,fs,overlap);
[features2b]=featureWindowedPW(s2B,fs,overlap);
features2=[features2a; features2b];
labels2=[zeros(1,size(features2a,1)) ones(1,size(features2b,1))];

newOrder=randperm(size(features2,1));
features2=features2(newOrder,:);
labels2=labels2(newOrder);

lim2=min([size(features2a,1),size(features2b,1)]);




newOrder=randperm(lim2);
f2ba=features2a(newOrder,:);
f2bb=features2b(newOrder,:);
%featuresB2=[f2ba; f2bb];

featuresB2=[f2ba f2bb];
featuresB2=reshape(featuresB2,[(2*lim2) , size(features2b,2)]);


labelsB2=[zeros(1,size(f2ba,1)) ones(1,size(f2bb,1))];
featuresB2=featuresB2(newOrder,:);
labelsB2=labelsB2(newOrder);
[featuresB2,labelsB2]=balanceClasses(features2a,features2b);
[featuresT2,labelsT2]=truncateClasses(features2a,features2b);

% combine them
subs=2;

% standard
features=[];
labels=[];
features{1}=features1;
features{2}=features2;

labels{1}=labels1;
labels{2}=labels2;

% balanced
featuresB=[];
labelsB=[];
featuresB{1}=featuresB1;
featuresB{2}=featuresB2;

labelsB{1}=labelsB1;
labelsB{2}=labelsB2;

% truncate
featuresT=[];
labelsT=[];
featuresT{1}=featuresT1;
featuresT{2}=featuresT2;

labelsT{1}=labelsT1;
labelsT{2}=labelsT2;

close all;

%% xval tests

% rapid
p=1;
xval=comparisonTestsRapid(features,labels,subs,p,fs);
bestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresB,labelsB,subs,p,fs);
bbestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresT,labelsT,subs,p,fs);
tbestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

p=10;
xval=comparisonTestsRapid(features,labels,subs,p,fs);
bestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresB,labelsB,subs,p,fs);
bbestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresT,labelsT,subs,p,fs);
tbestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

p=20;
xval=comparisonTestsRapid(features,labels,subs,p,fs);
bestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresB,labelsB,subs,p,fs);
bbestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresT,labelsT,subs,p,fs);
tbestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);


p=30;
xval=comparisonTestsRapid(features,labels,subs,p,fs);
bestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresB,labelsB,subs,p,fs);
bbestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresT,labelsT,subs,p,fs);
tbestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

p=34;
xval=comparisonTestsRapid(features,labels,subs,p,fs);
bestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresB,labelsB,subs,p,fs);
bbestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

xval=comparisonTestsRapid(featuresT,labelsT,subs,p,fs);
tbestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);

% thorough

% rapid
p=1;
xval=comparisonTests(features,labels,subs,p,fs);
bestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bestAdaAcc1=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bestAdaF11=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bestAccSvm1=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bestF1Svm1=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);


xval=comparisonTests(featuresB,labelsB,subs,p,fs);
bbestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bbestAdaAcc1=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bbestAdaF11=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bbestAccSvm1=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bbestF1Svm1=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresT,labelsT,subs,p,fs);
tbestAcc1=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF11=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
tbestAdaAcc1=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
tbestAdaF11=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
tbestAccSvm1=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
tbestF1Svm1=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

p=10;
xval=comparisonTests(features,labels,subs,p,fs);
bestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bestAdaAcc10=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bestAdaF110=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bestAccSvm10=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bestF1Svm10=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresB,labelsB,subs,p,fs);
bbestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bbestAdaAcc10=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bbestAdaF110=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bbestAccSvm10=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bbestF1Svm10=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresT,labelsT,subs,p,fs);
tbestAcc10=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF110=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
tbestAdaAcc10=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
tbestAdaF110=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
tbestAccSvm10=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
tbestF1Svm10=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

p=20;
xval=comparisonTests(features,labels,subs,p,fs);
bestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bestAdaAcc20=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bestAdaF120=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bestAccSvm20=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bestF1Svm20=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresB,labelsB,subs,p,fs);
bbestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bbestAdaAcc20=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bbestAdaF120=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bbestAccSvm20=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bbestF1Svm20=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresT,labelsT,subs,p,fs);
tbestAcc20=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF120=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
tbestAdaAcc20=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
tbestAdaF120=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
tbestAccSvm20=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
tbestF1Svm20=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);


p=30;
xval=comparisonTests(features,labels,subs,p,fs);
bestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bestAdaAcc30=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bestAdaF130=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bestAccSvm30=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bestF1Svm30=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresB,labelsB,subs,p,fs);
bbestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bbestAdaAcc30=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bbestAdaF130=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bbestAccSvm30=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bbestF1Svm30=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresT,labelsT,subs,p,fs);
tbestAcc30=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF130=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
tbestAdaAcc30=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
tbestAdaF130=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
tbestAccSvm30=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
tbestF1Svm30=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

p=34;
xval=comparisonTests(features,labels,subs,p,fs);
bestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bestAdaAcc34=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bestAdaF134=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bestAccSvm34=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bestF1Svm34=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresB,labelsB,subs,p,fs);
bbestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
bbestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
bbestAdaAcc34=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
bbestAdaF134=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
bbestAccSvm34=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
bbestF1Svm34=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

xval=comparisonTests(featuresT,labelsT,subs,p,fs);
tbestAcc34=max([xval.lda.pca.mean.acc,xval.lda.aden.mean.acc,xval.lda.adenz.mean.acc]);
tbestF134=max([xval.lda.pca.mean.f1,xval.lda.aden.mean.f1,xval.lda.adenz.mean.f1]);
tbestAdaAcc34=max([xval.adaboost.aden.mean.acc,xval.adaboost.adenz.mean.acc]);
tbestAdaF134=max([xval.adaboost.aden.mean.f1,xval.adaboost.adenz.mean.f1]);
tbestAccSvm34=max([xval.svm.aden.mean.acc,xval.svm.adenz.mean.acc,xval.svmp.aden.mean.acc,xval.svmp.adenz.mean.acc]);
tbestF1Svm34=max([xval.svm.aden.mean.f1,xval.svm.adenz.mean.f1,xval.svmp.aden.mean.f1,xval.svmp.adenz.mean.f1]);

