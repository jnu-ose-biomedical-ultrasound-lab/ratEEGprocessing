function [y]=unifyChannel(y)


%--------------------------------------------------------------------------
 % UNIFYCHANNEL

 % Last updated: December 2019, J. LaRocco

 % Details: Sets multiple channels of data into one vector. 
 
 % Usage:
 % [y]=unifyChannel(y)
 
 % Input: 
 %  y: Input data matrix.   

 % Output: 
 %  y: Reorganized data matrix.    
    
%--------------------------------------------------------------------------


%turns multi-channel data into one channel, reduces 3D data to 2D matrix
[w,l,h]=size(y);

y=reshape(y,w*l,h);

end