%% load results
data=[];
load('ratResults.mat','totalResults');
x=zeros(10,16);
%% bbest

%one
% lda
x(1,1)=totalResults.one.balanced.lda.pca.mean.acc;
x(2,1)=totalResults.one.balanced.lda.pca.mean.f1;

x(1,2)=totalResults.one.balanced.lda.aden.mean.acc;
x(2,2)=totalResults.one.balanced.lda.aden.mean.f1;

x(1,3)=totalResults.one.balanced.lda.adenz.mean.acc;
x(2,3)=totalResults.one.balanced.lda.adenz.mean.f1;

x(1,4)=max(x(1,[1:4]));
x(2,4)=max(x(2,[1:4]));

% adaboost
x(1,5)=totalResults.one.balanced.adaboost.pca.adenz.mean.acc;
x(2,5)=totalResults.one.balanced.adaboost.pca.adenz.mean.f1;

x(1,6)=totalResults.one.balanced.adaboost.aden.mean.acc;
x(2,6)=totalResults.one.balanced.adaboost.aden.mean.f1;

x(1,7)=totalResults.one.balanced.adaboost.adenz.mean.acc;
x(2,7)=totalResults.one.balanced.adaboost.adenz.mean.f1;

x(1,8)=max(x(1,[5:8]));
x(2,8)=max(x(2,[5:8]));

% svmg
x(1,9)=totalResults.one.balanced.svm.pca.mean.acc;
x(2,9)=totalResults.one.balanced.svm.pca.mean.f1;

x(1,10)=totalResults.one.balanced.svm.aden.mean.acc;
x(2,10)=totalResults.one.balanced.svm.aden.mean.f1;

x(1,11)=totalResults.one.balanced.svm.adenz.mean.acc;
x(2,11)=totalResults.one.balanced.svm.adenz.mean.f1;

x(1,12)=max(x(1,[9:12]));
x(2,12)=max(x(2,[9:12]));

% svmp
x(1,13)=totalResults.one.balanced.svmp.pca.mean.acc;
x(2,13)=totalResults.one.balanced.svmp.pca.mean.f1;

x(1,14)=totalResults.one.balanced.svmp.aden.mean.acc;
x(2,14)=totalResults.one.balanced.svmp.aden.mean.f1;

x(1,15)=totalResults.one.balanced.svmp.adenz.mean.acc;
x(2,15)=totalResults.one.balanced.svmp.adenz.mean.f1;

x(1,16)=max(x(1,[13:16]));
x(2,16)=max(x(2,[13:16]));

% ten
% lda
x(3,1)=totalResults.ten.balanced.lda.pca.mean.acc;
x(4,1)=totalResults.ten.balanced.lda.pca.mean.f1;

x(3,2)=totalResults.ten.balanced.lda.aden.mean.acc;
x(4,2)=totalResults.ten.balanced.lda.aden.mean.f1;

x(3,3)=totalResults.ten.balanced.lda.adenz.mean.acc;
x(4,3)=totalResults.ten.balanced.lda.adenz.mean.f1;

x(3,4)=max(x(3,[1:4]));
x(4,4)=max(x(4,[1:4]));

% adaboost
x(3,5)=totalResults.ten.balanced.adaboost.pca.adenz.mean.acc;
x(4,5)=totalResults.ten.balanced.adaboost.pca.adenz.mean.f1;

x(3,6)=totalResults.ten.balanced.adaboost.aden.mean.acc;
x(4,6)=totalResults.ten.balanced.adaboost.aden.mean.f1;

x(3,7)=totalResults.ten.balanced.adaboost.adenz.mean.acc;
x(4,7)=totalResults.ten.balanced.adaboost.adenz.mean.f1;

x(3,8)=max(x(3,[5:8]));
x(4,8)=max(x(4,[5:8]));

% svmg
x(3,9)=totalResults.ten.balanced.svm.pca.mean.acc;
x(4,9)=totalResults.ten.balanced.svm.pca.mean.f1;

x(3,10)=totalResults.ten.balanced.svm.aden.mean.acc;
x(4,10)=totalResults.ten.balanced.svm.aden.mean.f1;

x(3,11)=totalResults.ten.balanced.svm.adenz.mean.acc;
x(4,11)=totalResults.ten.balanced.svm.adenz.mean.f1;

x(3,12)=max(x(3,[9:12]));
x(4,12)=max(x(4,[9:12]));

% svmp
x(3,13)=totalResults.ten.balanced.svmp.pca.mean.acc;
x(4,13)=totalResults.ten.balanced.svmp.pca.mean.f1;

x(3,14)=totalResults.ten.balanced.svmp.aden.mean.acc;
x(4,14)=totalResults.ten.balanced.svmp.aden.mean.f1;

x(3,15)=totalResults.ten.balanced.svmp.adenz.mean.acc;
x(4,15)=totalResults.ten.balanced.svmp.adenz.mean.f1;

x(3,16)=max(x(3,[13:16]));
x(4,16)=max(x(4,[13:16]));

% twenty
% lda
x(5,1)=totalResults.twenty.balanced.lda.pca.mean.acc;
x(6,1)=totalResults.twenty.balanced.lda.pca.mean.f1;

x(5,2)=totalResults.twenty.balanced.lda.aden.mean.acc;
x(6,2)=totalResults.twenty.balanced.lda.aden.mean.f1;

x(5,3)=totalResults.twenty.balanced.lda.adenz.mean.acc;
x(6,3)=totalResults.twenty.balanced.lda.adenz.mean.f1;

x(5,4)=max(x(5,[1:4]));
x(6,4)=max(x(6,[1:4]));

% adaboost
x(5,5)=totalResults.twenty.balanced.adaboost.pca.adenz.mean.acc;
x(6,5)=totalResults.twenty.balanced.adaboost.pca.adenz.mean.f1;

x(5,6)=totalResults.twenty.balanced.adaboost.aden.mean.acc;
x(6,6)=totalResults.twenty.balanced.adaboost.aden.mean.f1;

x(5,7)=totalResults.twenty.balanced.adaboost.adenz.mean.acc;
x(6,7)=totalResults.twenty.balanced.adaboost.adenz.mean.f1;

x(5,8)=max(x(5,[5:8]));
x(6,8)=max(x(6,[5:8]));

% svmg
x(5,9)=totalResults.twenty.balanced.svm.pca.mean.acc;
x(6,9)=totalResults.twenty.balanced.svm.pca.mean.f1;

x(5,10)=totalResults.twenty.balanced.svm.aden.mean.acc;
x(6,10)=totalResults.twenty.balanced.svm.aden.mean.f1;

x(5,11)=totalResults.twenty.balanced.svm.adenz.mean.acc;
x(6,11)=totalResults.twenty.balanced.svm.adenz.mean.f1;

x(5,12)=max(x(5,[9:12]));
x(6,12)=max(x(6,[9:12]));

% svmp
x(5,13)=totalResults.twenty.balanced.svmp.pca.mean.acc;
x(6,13)=totalResults.twenty.balanced.svmp.pca.mean.f1;

x(5,14)=totalResults.twenty.balanced.svmp.aden.mean.acc;
x(6,14)=totalResults.twenty.balanced.svmp.aden.mean.f1;

x(5,15)=totalResults.twenty.balanced.svmp.adenz.mean.acc;
x(6,15)=totalResults.twenty.balanced.svmp.adenz.mean.f1;

x(5,16)=max(x(5,[13:16]));
x(6,16)=max(x(6,[13:16]));

% thirty
% lda
x(7,1)=totalResults.thirty.balanced.lda.pca.mean.acc;
x(8,1)=totalResults.thirty.balanced.lda.pca.mean.f1;

x(7,2)=totalResults.thirty.balanced.lda.aden.mean.acc;
x(8,2)=totalResults.thirty.balanced.lda.aden.mean.f1;

x(7,3)=totalResults.thirty.balanced.lda.adenz.mean.acc;
x(8,3)=totalResults.thirty.balanced.lda.adenz.mean.f1;

x(7,4)=max(x(7,[1:4]));
x(8,4)=max(x(8,[1:4]));

% adaboost
x(7,5)=totalResults.thirty.balanced.adaboost.pca.adenz.mean.acc;
x(8,5)=totalResults.thirty.balanced.adaboost.pca.adenz.mean.f1;

x(7,6)=totalResults.thirty.balanced.adaboost.aden.mean.acc;
x(8,6)=totalResults.thirty.balanced.adaboost.aden.mean.f1;

x(7,7)=totalResults.thirty.balanced.adaboost.adenz.mean.acc;
x(8,7)=totalResults.thirty.balanced.adaboost.adenz.mean.f1;

x(7,8)=max(x(7,[5:8]));
x(8,8)=max(x(8,[5:8]));

% svmg
x(7,9)=totalResults.thirty.balanced.svm.pca.mean.acc;
x(8,9)=totalResults.thirty.balanced.svm.pca.mean.f1;

x(7,10)=totalResults.thirty.balanced.svm.aden.mean.acc;
x(8,10)=totalResults.thirty.balanced.svm.aden.mean.f1;

x(7,11)=totalResults.thirty.balanced.svm.adenz.mean.acc;
x(8,11)=totalResults.thirty.balanced.svm.adenz.mean.f1;

x(7,12)=max(x(7,[9:12]));
x(8,12)=max(x(8,[9:12]));

% svmp
x(7,13)=totalResults.thirty.balanced.svmp.pca.mean.acc;
x(8,13)=totalResults.thirty.balanced.svmp.pca.mean.f1;

x(7,14)=totalResults.thirty.balanced.svmp.aden.mean.acc;
x(8,14)=totalResults.thirty.balanced.svmp.aden.mean.f1;

x(7,15)=totalResults.thirty.balanced.svmp.adenz.mean.acc;
x(8,15)=totalResults.thirty.balanced.svmp.adenz.mean.f1;

x(7,16)=max(x(7,[13:16]));
x(8,16)=max(x(8,[13:16]));

% thirtyfour
% lda
x(9,1)=totalResults.thirtyfour.balanced.lda.pca.mean.acc;
x(10,1)=totalResults.thirtyfour.balanced.lda.pca.mean.f1;

x(9,2)=totalResults.thirtyfour.balanced.lda.aden.mean.acc;
x(10,2)=totalResults.thirtyfour.balanced.lda.aden.mean.f1;

x(9,3)=totalResults.thirtyfour.balanced.lda.adenz.mean.acc;
x(10,3)=totalResults.thirtyfour.balanced.lda.adenz.mean.f1;

x(9,4)=max(x(9,[1:4]));
x(10,4)=max(x(10,[1:4]));

% adaboost
x(9,5)=totalResults.thirtyfour.balanced.adaboost.pca.adenz.mean.acc;
x(10,5)=totalResults.thirtyfour.balanced.adaboost.pca.adenz.mean.f1;

x(9,6)=totalResults.thirtyfour.balanced.adaboost.aden.mean.acc;
x(10,6)=totalResults.thirtyfour.balanced.adaboost.aden.mean.f1;

x(9,7)=totalResults.thirtyfour.balanced.adaboost.adenz.mean.acc;
x(10,7)=totalResults.thirtyfour.balanced.adaboost.adenz.mean.f1;

x(9,8)=max(x(9,[5:8]));
x(10,8)=max(x(10,[5:8]));

% svmg
x(9,9)=totalResults.thirtyfour.balanced.svm.pca.mean.acc;
x(10,9)=totalResults.thirtyfour.balanced.svm.pca.mean.f1;

x(9,10)=totalResults.thirtyfour.balanced.svm.aden.mean.acc;
x(10,10)=totalResults.thirtyfour.balanced.svm.aden.mean.f1;

x(9,11)=totalResults.thirtyfour.balanced.svm.adenz.mean.acc;
x(10,11)=totalResults.thirtyfour.balanced.svm.adenz.mean.f1;

x(9,12)=max(x(9,[9:12]));
x(10,12)=max(x(10,[9:12]));

% svmp
x(9,13)=totalResults.thirtyfour.balanced.svmp.pca.mean.acc;
x(10,13)=totalResults.thirtyfour.balanced.svmp.pca.mean.f1;

x(9,14)=totalResults.thirtyfour.balanced.svmp.aden.mean.acc;
x(10,14)=totalResults.thirtyfour.balanced.svmp.aden.mean.f1;

x(9,15)=totalResults.thirtyfour.balanced.svmp.adenz.mean.acc;
x(10,15)=totalResults.thirtyfour.balanced.svmp.adenz.mean.f1;

x(9,16)=max(x(9,[13:16]));
x(10,16)=max(x(10,[13:16]));

data.balanced=x;

%% tbest
x=zeros(10,16);
%% bbest
 
%one
% lda
x(1,1)=totalResults.one.truncated.lda.pca.mean.acc;
x(2,1)=totalResults.one.truncated.lda.pca.mean.f1;
 
x(1,2)=totalResults.one.truncated.lda.aden.mean.acc;
x(2,2)=totalResults.one.truncated.lda.aden.mean.f1;
 
x(1,3)=totalResults.one.truncated.lda.adenz.mean.acc;
x(2,3)=totalResults.one.truncated.lda.adenz.mean.f1;
 
x(1,4)=max(x(1,[1:4]));
x(2,4)=max(x(2,[1:4]));
 
% adaboost
x(1,5)=totalResults.one.truncated.adaboost.pca.adenz.mean.acc;
x(2,5)=totalResults.one.truncated.adaboost.pca.adenz.mean.f1;
 
x(1,6)=totalResults.one.truncated.adaboost.aden.mean.acc;
x(2,6)=totalResults.one.truncated.adaboost.aden.mean.f1;
 
x(1,7)=totalResults.one.truncated.adaboost.adenz.mean.acc;
x(2,7)=totalResults.one.truncated.adaboost.adenz.mean.f1;
 
x(1,8)=max(x(1,[5:8]));
x(2,8)=max(x(2,[5:8]));
 
% svmg
x(1,9)=totalResults.one.truncated.svm.pca.mean.acc;
x(2,9)=totalResults.one.truncated.svm.pca.mean.f1;
 
x(1,10)=totalResults.one.truncated.svm.aden.mean.acc;
x(2,10)=totalResults.one.truncated.svm.aden.mean.f1;
 
x(1,11)=totalResults.one.truncated.svm.adenz.mean.acc;
x(2,11)=totalResults.one.truncated.svm.adenz.mean.f1;
 
x(1,12)=max(x(1,[9:12]));
x(2,12)=max(x(2,[9:12]));
 
% svmp
x(1,13)=totalResults.one.truncated.svmp.pca.mean.acc;
x(2,13)=totalResults.one.truncated.svmp.pca.mean.f1;
 
x(1,14)=totalResults.one.truncated.svmp.aden.mean.acc;
x(2,14)=totalResults.one.truncated.svmp.aden.mean.f1;
 
x(1,15)=totalResults.one.truncated.svmp.adenz.mean.acc;
x(2,15)=totalResults.one.truncated.svmp.adenz.mean.f1;
 
x(1,16)=max(x(1,[13:16]));
x(2,16)=max(x(2,[13:16]));
 
% ten
% lda
x(3,1)=totalResults.ten.truncated.lda.pca.mean.acc;
x(4,1)=totalResults.ten.truncated.lda.pca.mean.f1;
 
x(3,2)=totalResults.ten.truncated.lda.aden.mean.acc;
x(4,2)=totalResults.ten.truncated.lda.aden.mean.f1;
 
x(3,3)=totalResults.ten.truncated.lda.adenz.mean.acc;
x(4,3)=totalResults.ten.truncated.lda.adenz.mean.f1;
 
x(3,4)=max(x(3,[1:4]));
x(4,4)=max(x(4,[1:4]));
 
% adaboost
x(3,5)=totalResults.ten.truncated.adaboost.pca.adenz.mean.acc;
x(4,5)=totalResults.ten.truncated.adaboost.pca.adenz.mean.f1;
 
x(3,6)=totalResults.ten.truncated.adaboost.aden.mean.acc;
x(4,6)=totalResults.ten.truncated.adaboost.aden.mean.f1;
 
x(3,7)=totalResults.ten.truncated.adaboost.adenz.mean.acc;
x(4,7)=totalResults.ten.truncated.adaboost.adenz.mean.f1;
 
x(3,8)=max(x(3,[5:8]));
x(4,8)=max(x(4,[5:8]));
 
% svmg
x(3,9)=totalResults.ten.truncated.svm.pca.mean.acc;
x(4,9)=totalResults.ten.truncated.svm.pca.mean.f1;
 
x(3,10)=totalResults.ten.truncated.svm.aden.mean.acc;
x(4,10)=totalResults.ten.truncated.svm.aden.mean.f1;
 
x(3,11)=totalResults.ten.truncated.svm.adenz.mean.acc;
x(4,11)=totalResults.ten.truncated.svm.adenz.mean.f1;
 
x(3,12)=max(x(3,[9:12]));
x(4,12)=max(x(4,[9:12]));
 
% svmp
x(3,13)=totalResults.ten.truncated.svmp.pca.mean.acc;
x(4,13)=totalResults.ten.truncated.svmp.pca.mean.f1;
 
x(3,14)=totalResults.ten.truncated.svmp.aden.mean.acc;
x(4,14)=totalResults.ten.truncated.svmp.aden.mean.f1;
 
x(3,15)=totalResults.ten.truncated.svmp.adenz.mean.acc;
x(4,15)=totalResults.ten.truncated.svmp.adenz.mean.f1;
 
x(3,16)=max(x(3,[13:16]));
x(4,16)=max(x(4,[13:16]));
 
% twenty
% lda
x(5,1)=totalResults.twenty.truncated.lda.pca.mean.acc;
x(6,1)=totalResults.twenty.truncated.lda.pca.mean.f1;
 
x(5,2)=totalResults.twenty.truncated.lda.aden.mean.acc;
x(6,2)=totalResults.twenty.truncated.lda.aden.mean.f1;
 
x(5,3)=totalResults.twenty.truncated.lda.adenz.mean.acc;
x(6,3)=totalResults.twenty.truncated.lda.adenz.mean.f1;
 
x(5,4)=max(x(5,[1:4]));
x(6,4)=max(x(6,[1:4]));
 
% adaboost
x(5,5)=totalResults.twenty.truncated.adaboost.pca.adenz.mean.acc;
x(6,5)=totalResults.twenty.truncated.adaboost.pca.adenz.mean.f1;
 
x(5,6)=totalResults.twenty.truncated.adaboost.aden.mean.acc;
x(6,6)=totalResults.twenty.truncated.adaboost.aden.mean.f1;
 
x(5,7)=totalResults.twenty.truncated.adaboost.adenz.mean.acc;
x(6,7)=totalResults.twenty.truncated.adaboost.adenz.mean.f1;
 
x(5,8)=max(x(5,[5:8]));
x(6,8)=max(x(6,[5:8]));
 
% svmg
x(5,9)=totalResults.twenty.truncated.svm.pca.mean.acc;
x(6,9)=totalResults.twenty.truncated.svm.pca.mean.f1;
 
x(5,10)=totalResults.twenty.truncated.svm.aden.mean.acc;
x(6,10)=totalResults.twenty.truncated.svm.aden.mean.f1;
 
x(5,11)=totalResults.twenty.truncated.svm.adenz.mean.acc;
x(6,11)=totalResults.twenty.truncated.svm.adenz.mean.f1;
 
x(5,12)=max(x(5,[9:12]));
x(6,12)=max(x(6,[9:12]));
 
% svmp
x(5,13)=totalResults.twenty.truncated.svmp.pca.mean.acc;
x(6,13)=totalResults.twenty.truncated.svmp.pca.mean.f1;
 
x(5,14)=totalResults.twenty.truncated.svmp.aden.mean.acc;
x(6,14)=totalResults.twenty.truncated.svmp.aden.mean.f1;
 
x(5,15)=totalResults.twenty.truncated.svmp.adenz.mean.acc;
x(6,15)=totalResults.twenty.truncated.svmp.adenz.mean.f1;
 
x(5,16)=max(x(5,[13:16]));
x(6,16)=max(x(6,[13:16]));
 
% thirty
% lda
x(7,1)=totalResults.thirty.truncated.lda.pca.mean.acc;
x(8,1)=totalResults.thirty.truncated.lda.pca.mean.f1;
 
x(7,2)=totalResults.thirty.truncated.lda.aden.mean.acc;
x(8,2)=totalResults.thirty.truncated.lda.aden.mean.f1;
 
x(7,3)=totalResults.thirty.truncated.lda.adenz.mean.acc;
x(8,3)=totalResults.thirty.truncated.lda.adenz.mean.f1;
 
x(7,4)=max(x(7,[1:4]));
x(8,4)=max(x(8,[1:4]));
 
% adaboost
x(7,5)=totalResults.thirty.truncated.adaboost.pca.adenz.mean.acc;
x(8,5)=totalResults.thirty.truncated.adaboost.pca.adenz.mean.f1;
 
x(7,6)=totalResults.thirty.truncated.adaboost.aden.mean.acc;
x(8,6)=totalResults.thirty.truncated.adaboost.aden.mean.f1;
 
x(7,7)=totalResults.thirty.truncated.adaboost.adenz.mean.acc;
x(8,7)=totalResults.thirty.truncated.adaboost.adenz.mean.f1;
 
x(7,8)=max(x(7,[5:8]));
x(8,8)=max(x(8,[5:8]));
 
% svmg
x(7,9)=totalResults.thirty.truncated.svm.pca.mean.acc;
x(8,9)=totalResults.thirty.truncated.svm.pca.mean.f1;
 
x(7,10)=totalResults.thirty.truncated.svm.aden.mean.acc;
x(8,10)=totalResults.thirty.truncated.svm.aden.mean.f1;
 
x(7,11)=totalResults.thirty.truncated.svm.adenz.mean.acc;
x(8,11)=totalResults.thirty.truncated.svm.adenz.mean.f1;
 
x(7,12)=max(x(7,[9:12]));
x(8,12)=max(x(8,[9:12]));
 
% svmp
x(7,13)=totalResults.thirty.truncated.svmp.pca.mean.acc;
x(8,13)=totalResults.thirty.truncated.svmp.pca.mean.f1;
 
x(7,14)=totalResults.thirty.truncated.svmp.aden.mean.acc;
x(8,14)=totalResults.thirty.truncated.svmp.aden.mean.f1;
 
x(7,15)=totalResults.thirty.truncated.svmp.adenz.mean.acc;
x(8,15)=totalResults.thirty.truncated.svmp.adenz.mean.f1;
 
x(7,16)=max(x(7,[13:16]));
x(8,16)=max(x(8,[13:16]));
 
% thirtyfour
% lda
x(9,1)=totalResults.thirtyfour.truncated.lda.pca.mean.acc;
x(10,1)=totalResults.thirtyfour.truncated.lda.pca.mean.f1;
 
x(9,2)=totalResults.thirtyfour.truncated.lda.aden.mean.acc;
x(10,2)=totalResults.thirtyfour.truncated.lda.aden.mean.f1;
 
x(9,3)=totalResults.thirtyfour.truncated.lda.adenz.mean.acc;
x(10,3)=totalResults.thirtyfour.truncated.lda.adenz.mean.f1;
 
x(9,4)=max(x(9,[1:4]));
x(10,4)=max(x(10,[1:4]));
 
% adaboost
x(9,5)=totalResults.thirtyfour.truncated.adaboost.pca.adenz.mean.acc;
x(10,5)=totalResults.thirtyfour.truncated.adaboost.pca.adenz.mean.f1;
 
x(9,6)=totalResults.thirtyfour.truncated.adaboost.aden.mean.acc;
x(10,6)=totalResults.thirtyfour.truncated.adaboost.aden.mean.f1;
 
x(9,7)=totalResults.thirtyfour.truncated.adaboost.adenz.mean.acc;
x(10,7)=totalResults.thirtyfour.truncated.adaboost.adenz.mean.f1;
 
x(9,8)=max(x(9,[5:8]));
x(10,8)=max(x(10,[5:8]));
 
% svmg
x(9,9)=totalResults.thirtyfour.truncated.svm.pca.mean.acc;
x(10,9)=totalResults.thirtyfour.truncated.svm.pca.mean.f1;
 
x(9,10)=totalResults.thirtyfour.truncated.svm.aden.mean.acc;
x(10,10)=totalResults.thirtyfour.truncated.svm.aden.mean.f1;
 
x(9,11)=totalResults.thirtyfour.truncated.svm.adenz.mean.acc;
x(10,11)=totalResults.thirtyfour.truncated.svm.adenz.mean.f1;
 
x(9,12)=max(x(9,[9:12]));
x(10,12)=max(x(10,[9:12]));
 
% svmp
x(9,13)=totalResults.thirtyfour.truncated.svmp.pca.mean.acc;
x(10,13)=totalResults.thirtyfour.truncated.svmp.pca.mean.f1;
 
x(9,14)=totalResults.thirtyfour.truncated.svmp.aden.mean.acc;
x(10,14)=totalResults.thirtyfour.truncated.svmp.aden.mean.f1;
 
x(9,15)=totalResults.thirtyfour.truncated.svmp.adenz.mean.acc;
x(10,15)=totalResults.thirtyfour.truncated.svmp.adenz.mean.f1;
 
x(9,16)=max(x(9,[13:16]));
x(10,16)=max(x(10,[13:16]));
 
data.truncated=x;



%% best
x=zeros(10,16);
%% bbest
 
%one
% lda
x(1,1)=totalResults.one.standard.lda.pca.mean.acc;
x(2,1)=totalResults.one.standard.lda.pca.mean.f1;
 
x(1,2)=totalResults.one.standard.lda.aden.mean.acc;
x(2,2)=totalResults.one.standard.lda.aden.mean.f1;
 
x(1,3)=totalResults.one.standard.lda.adenz.mean.acc;
x(2,3)=totalResults.one.standard.lda.adenz.mean.f1;
 
x(1,4)=max(x(1,[1:4]));
x(2,4)=max(x(2,[1:4]));
 
% adaboost
x(1,5)=totalResults.one.standard.adaboost.pca.adenz.mean.acc;
x(2,5)=totalResults.one.standard.adaboost.pca.adenz.mean.f1;
 
x(1,6)=totalResults.one.standard.adaboost.aden.mean.acc;
x(2,6)=totalResults.one.standard.adaboost.aden.mean.f1;
 
x(1,7)=totalResults.one.standard.adaboost.adenz.mean.acc;
x(2,7)=totalResults.one.standard.adaboost.adenz.mean.f1;
 
x(1,8)=max(x(1,[5:8]));
x(2,8)=max(x(2,[5:8]));
 
% svmg
x(1,9)=totalResults.one.standard.svm.pca.mean.acc;
x(2,9)=totalResults.one.standard.svm.pca.mean.f1;
 
x(1,10)=totalResults.one.standard.svm.aden.mean.acc;
x(2,10)=totalResults.one.standard.svm.aden.mean.f1;
 
x(1,11)=totalResults.one.standard.svm.adenz.mean.acc;
x(2,11)=totalResults.one.standard.svm.adenz.mean.f1;
 
x(1,12)=max(x(1,[9:12]));
x(2,12)=max(x(2,[9:12]));
 
% svmp
x(1,13)=totalResults.one.standard.svmp.pca.mean.acc;
x(2,13)=totalResults.one.standard.svmp.pca.mean.f1;
 
x(1,14)=totalResults.one.standard.svmp.aden.mean.acc;
x(2,14)=totalResults.one.standard.svmp.aden.mean.f1;
 
x(1,15)=totalResults.one.standard.svmp.adenz.mean.acc;
x(2,15)=totalResults.one.standard.svmp.adenz.mean.f1;
 
x(1,16)=max(x(1,[13:16]));
x(2,16)=max(x(2,[13:16]));
 
% ten
% lda
x(3,1)=totalResults.ten.standard.lda.pca.mean.acc;
x(4,1)=totalResults.ten.standard.lda.pca.mean.f1;
 
x(3,2)=totalResults.ten.standard.lda.aden.mean.acc;
x(4,2)=totalResults.ten.standard.lda.aden.mean.f1;
 
x(3,3)=totalResults.ten.standard.lda.adenz.mean.acc;
x(4,3)=totalResults.ten.standard.lda.adenz.mean.f1;
 
x(3,4)=max(x(3,[1:4]));
x(4,4)=max(x(4,[1:4]));
 
% adaboost
x(3,5)=totalResults.ten.standard.adaboost.pca.adenz.mean.acc;
x(4,5)=totalResults.ten.standard.adaboost.pca.adenz.mean.f1;
 
x(3,6)=totalResults.ten.standard.adaboost.aden.mean.acc;
x(4,6)=totalResults.ten.standard.adaboost.aden.mean.f1;
 
x(3,7)=totalResults.ten.standard.adaboost.adenz.mean.acc;
x(4,7)=totalResults.ten.standard.adaboost.adenz.mean.f1;
 
x(3,8)=max(x(3,[5:8]));
x(4,8)=max(x(4,[5:8]));
 
% svmg
x(3,9)=totalResults.ten.standard.svm.pca.mean.acc;
x(4,9)=totalResults.ten.standard.svm.pca.mean.f1;
 
x(3,10)=totalResults.ten.standard.svm.aden.mean.acc;
x(4,10)=totalResults.ten.standard.svm.aden.mean.f1;
 
x(3,11)=totalResults.ten.standard.svm.adenz.mean.acc;
x(4,11)=totalResults.ten.standard.svm.adenz.mean.f1;
 
x(3,12)=max(x(3,[9:12]));
x(4,12)=max(x(4,[9:12]));
 
% svmp
x(3,13)=totalResults.ten.standard.svmp.pca.mean.acc;
x(4,13)=totalResults.ten.standard.svmp.pca.mean.f1;
 
x(3,14)=totalResults.ten.standard.svmp.aden.mean.acc;
x(4,14)=totalResults.ten.standard.svmp.aden.mean.f1;
 
x(3,15)=totalResults.ten.standard.svmp.adenz.mean.acc;
x(4,15)=totalResults.ten.standard.svmp.adenz.mean.f1;
 
x(3,16)=max(x(3,[13:16]));
x(4,16)=max(x(4,[13:16]));
 
% twenty
% lda
x(5,1)=totalResults.twenty.standard.lda.pca.mean.acc;
x(6,1)=totalResults.twenty.standard.lda.pca.mean.f1;
 
x(5,2)=totalResults.twenty.standard.lda.aden.mean.acc;
x(6,2)=totalResults.twenty.standard.lda.aden.mean.f1;
 
x(5,3)=totalResults.twenty.standard.lda.adenz.mean.acc;
x(6,3)=totalResults.twenty.standard.lda.adenz.mean.f1;
 
x(5,4)=max(x(5,[1:4]));
x(6,4)=max(x(6,[1:4]));
 
% adaboost
x(5,5)=totalResults.twenty.standard.adaboost.pca.adenz.mean.acc;
x(6,5)=totalResults.twenty.standard.adaboost.pca.adenz.mean.f1;
 
x(5,6)=totalResults.twenty.standard.adaboost.aden.mean.acc;
x(6,6)=totalResults.twenty.standard.adaboost.aden.mean.f1;
 
x(5,7)=totalResults.twenty.standard.adaboost.adenz.mean.acc;
x(6,7)=totalResults.twenty.standard.adaboost.adenz.mean.f1;
 
x(5,8)=max(x(5,[5:8]));
x(6,8)=max(x(6,[5:8]));
 
% svmg
x(5,9)=totalResults.twenty.standard.svm.pca.mean.acc;
x(6,9)=totalResults.twenty.standard.svm.pca.mean.f1;
 
x(5,10)=totalResults.twenty.standard.svm.aden.mean.acc;
x(6,10)=totalResults.twenty.standard.svm.aden.mean.f1;
 
x(5,11)=totalResults.twenty.standard.svm.adenz.mean.acc;
x(6,11)=totalResults.twenty.standard.svm.adenz.mean.f1;
 
x(5,12)=max(x(5,[9:12]));
x(6,12)=max(x(6,[9:12]));
 
% svmp
x(5,13)=totalResults.twenty.standard.svmp.pca.mean.acc;
x(6,13)=totalResults.twenty.standard.svmp.pca.mean.f1;
 
x(5,14)=totalResults.twenty.standard.svmp.aden.mean.acc;
x(6,14)=totalResults.twenty.standard.svmp.aden.mean.f1;
 
x(5,15)=totalResults.twenty.standard.svmp.adenz.mean.acc;
x(6,15)=totalResults.twenty.standard.svmp.adenz.mean.f1;
 
x(5,16)=max(x(5,[13:16]));
x(6,16)=max(x(6,[13:16]));
 
% thirty
% lda
x(7,1)=totalResults.thirty.standard.lda.pca.mean.acc;
x(8,1)=totalResults.thirty.standard.lda.pca.mean.f1;
 
x(7,2)=totalResults.thirty.standard.lda.aden.mean.acc;
x(8,2)=totalResults.thirty.standard.lda.aden.mean.f1;
 
x(7,3)=totalResults.thirty.standard.lda.adenz.mean.acc;
x(8,3)=totalResults.thirty.standard.lda.adenz.mean.f1;
 
x(7,4)=max(x(7,[1:4]));
x(8,4)=max(x(8,[1:4]));
 
% adaboost
x(7,5)=totalResults.thirty.standard.adaboost.pca.adenz.mean.acc;
x(8,5)=totalResults.thirty.standard.adaboost.pca.adenz.mean.f1;
 
x(7,6)=totalResults.thirty.standard.adaboost.aden.mean.acc;
x(8,6)=totalResults.thirty.standard.adaboost.aden.mean.f1;
 
x(7,7)=totalResults.thirty.standard.adaboost.adenz.mean.acc;
x(8,7)=totalResults.thirty.standard.adaboost.adenz.mean.f1;
 
x(7,8)=max(x(7,[5:8]));
x(8,8)=max(x(8,[5:8]));
 
% svmg
x(7,9)=totalResults.thirty.standard.svm.pca.mean.acc;
x(8,9)=totalResults.thirty.standard.svm.pca.mean.f1;
 
x(7,10)=totalResults.thirty.standard.svm.aden.mean.acc;
x(8,10)=totalResults.thirty.standard.svm.aden.mean.f1;
 
x(7,11)=totalResults.thirty.standard.svm.adenz.mean.acc;
x(8,11)=totalResults.thirty.standard.svm.adenz.mean.f1;
 
x(7,12)=max(x(7,[9:12]));
x(8,12)=max(x(8,[9:12]));
 
% svmp
x(7,13)=totalResults.thirty.standard.svmp.pca.mean.acc;
x(8,13)=totalResults.thirty.standard.svmp.pca.mean.f1;
 
x(7,14)=totalResults.thirty.standard.svmp.aden.mean.acc;
x(8,14)=totalResults.thirty.standard.svmp.aden.mean.f1;
 
x(7,15)=totalResults.thirty.standard.svmp.adenz.mean.acc;
x(8,15)=totalResults.thirty.standard.svmp.adenz.mean.f1;
 
x(7,16)=max(x(7,[13:16]));
x(8,16)=max(x(8,[13:16]));
 
% thirtyfour
% lda
x(9,1)=totalResults.thirtyfour.standard.lda.pca.mean.acc;
x(10,1)=totalResults.thirtyfour.standard.lda.pca.mean.f1;
 
x(9,2)=totalResults.thirtyfour.standard.lda.aden.mean.acc;
x(10,2)=totalResults.thirtyfour.standard.lda.aden.mean.f1;
 
x(9,3)=totalResults.thirtyfour.standard.lda.adenz.mean.acc;
x(10,3)=totalResults.thirtyfour.standard.lda.adenz.mean.f1;
 
x(9,4)=max(x(9,[1:4]));
x(10,4)=max(x(10,[1:4]));
 
% adaboost
x(9,5)=totalResults.thirtyfour.standard.adaboost.pca.adenz.mean.acc;
x(10,5)=totalResults.thirtyfour.standard.adaboost.pca.adenz.mean.f1;
 
x(9,6)=totalResults.thirtyfour.standard.adaboost.aden.mean.acc;
x(10,6)=totalResults.thirtyfour.standard.adaboost.aden.mean.f1;
 
x(9,7)=totalResults.thirtyfour.standard.adaboost.adenz.mean.acc;
x(10,7)=totalResults.thirtyfour.standard.adaboost.adenz.mean.f1;
 
x(9,8)=max(x(9,[5:8]));
x(10,8)=max(x(10,[5:8]));
 
% svmg
x(9,9)=totalResults.thirtyfour.standard.svm.pca.mean.acc;
x(10,9)=totalResults.thirtyfour.standard.svm.pca.mean.f1;
 
x(9,10)=totalResults.thirtyfour.standard.svm.aden.mean.acc;
x(10,10)=totalResults.thirtyfour.standard.svm.aden.mean.f1;
 
x(9,11)=totalResults.thirtyfour.standard.svm.adenz.mean.acc;
x(10,11)=totalResults.thirtyfour.standard.svm.adenz.mean.f1;
 
x(9,12)=max(x(9,[9:12]));
x(10,12)=max(x(10,[9:12]));
 
% svmp
x(9,13)=totalResults.thirtyfour.standard.svmp.pca.mean.acc;
x(10,13)=totalResults.thirtyfour.standard.svmp.pca.mean.f1;
 
x(9,14)=totalResults.thirtyfour.standard.svmp.aden.mean.acc;
x(10,14)=totalResults.thirtyfour.standard.svmp.aden.mean.f1;
 
x(9,15)=totalResults.thirtyfour.standard.svmp.adenz.mean.acc;
x(10,15)=totalResults.thirtyfour.standard.svmp.adenz.mean.f1;
 
x(9,16)=max(x(9,[13:16]));
x(10,16)=max(x(10,[13:16]));
 
data.standard=x;

