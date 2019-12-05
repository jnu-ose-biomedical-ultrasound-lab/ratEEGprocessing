function [Pxx]=bandpowerPW(segments,fs)

%--------------------------------------------------------------------------
 % FEATURE_EXTRACTION_PW

 % Last updated: July 2013, J. LaRocco

 % Details: Feature extraction method, taking data from multiple periodograms using Welch method.  

 % Usage: [y]=bandpowerPW(segments,fs)
 
 % Input: 
 %  segments: Matrix of EEG data. (2D matrix, samples by channels)
 %  fs: sampling frequency. (scalar, real positive integer)
 
 % Output: 
 % Pxx: Pxx is the spectral features paper. (2D matrix, features by channels)
    
%--------------------------------------------------------------------------

Pxx=[];
[~,inst]=size(segments);

     for i=1:1:inst

spec_coefs=abs(pwelch(segments(:,i),[],[],[1:1:ceil(fs/2)],fs)); 

%mean spectral power
delta=mean([spec_coefs(1:5)]); %0-4 Hz
theta=mean([spec_coefs(5:9)]); %4-8 Hz

alpha_1=mean([spec_coefs(9:11)]); %8-10 Hz
alpha_2=mean([spec_coefs(11:13)]); %10-12 Hz
alpha=mean([spec_coefs(9:13)]); %8-12 Hz

beta_1=mean([spec_coefs(13:17)]); %12-16 Hz
beta_2=mean([spec_coefs(17:27)]); %16-26 Hz
beta=mean([spec_coefs(13:27)]); %12-26 Hz

gamma_1=mean([spec_coefs(27:37)]); %26-36 Hz
gamma_2=mean([spec_coefs(37:47)]); %36-46 Hz
gamma=mean([spec_coefs(27:47)]); %26-46 Hz

high_freq=mean([spec_coefs(48:99)]); %47-100 Hz
all_freq=mean([spec_coefs(1:99)]); %0-100 Hz

msp=[delta theta alpha_1 alpha_2 alpha beta_1 beta_2 beta gamma_1 gamma_2 gamma high_freq all_freq];
msp1=msp(1:(length(msp)-1));
%normalized spectral power
max_value=max(msp1);
nsp=msp1/max_value; 

%power ratios
ratio_1=nsp(2)/nsp(8);
ratio_2=nsp(2)/nsp(5);
ratio_3=nsp(5)/nsp(8);
ratio_4=nsp(1)/nsp(2);
ratio_5=nsp(5)/nsp(1);
ratio_6=nsp(8)/nsp(1);
ratio_7=nsp(6)/nsp(5);
ratio_8=nsp(7)/nsp(5);
ratio_9=nsp(6)/nsp(7);
power_ratios=[ratio_1 ratio_2 ratio_3 ratio_4 ratio_5 ratio_6 ratio_7 ratio_8 ratio_9]; 

spectral_coefs=[msp nsp power_ratios];
spectral_coefs=cleanUp(spectral_coefs); 
Pxx(:,i)=spectral_coefs;

end



end