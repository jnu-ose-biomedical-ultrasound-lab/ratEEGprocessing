function [features]=featureWindowedPW(segments,fs,overlap)

%--------------------------------------------------------------------------
 % featureWindowedPW

 % Last updated: December 2019, J. LaRocco

 % Details: Feature extraction method, taking data from multiple periodograms using Welch method.  

 % Usage: [y]=bandpowerPW(segments,fs,overlap)
 
 % Input: 
 %  segments: Matrix of EEG data. (2D matrix, samples by channels)
 %  fs: sampling frequency. (scalar, real positive integer)
 %  overlap: Overlap between windows during update (percentage between 0 and 1).
 
 % Output: 
 % features: features is the spectral features paper. (2D matrix, windows by features)
    
%--------------------------------------------------------------------------


[inst,chans]=size(segments);
secondLength=floor(inst/fs);
segments=segments([1:(fs*secondLength)],chans);

lBnd=1:ceil(fs*overlap):((fs*secondLength)-fs+1);
uBnd=fs:ceil(fs*overlap):(fs*secondLength);

capper=min([length(lBnd),length(uBnd)]);
lBnd=lBnd(1:capper);
uBnd=uBnd(1:capper);

features=zeros(capper,(chans*34));

for iii=1:capper
   features(iii,:)=squeeze(unifyChannel(cleanUp(bandpowerPW(segments([lBnd(iii):uBnd(iii)]),fs))));
    
end

end