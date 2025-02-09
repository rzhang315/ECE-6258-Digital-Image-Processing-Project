function [] = validationrf(y, results,xx)

TP = 0;FP = 0;TN = 0; FN = 0;
trueMat = y;
predictedMat = results;
adder = trueMat + predictedMat;
TP = length(find(adder == 2));
TN = length(find(adder == -2));
subtr = trueMat - predictedMat;
FP = length(find(subtr == -2));
FN = length(find(subtr == 2));
Sn = TP/(TP + FN);
Sp = TN/(TN + FP);
Accuracy = (((TP + TN)/(TP + TN + FP + FN)))*100;

if xx==1
figure(3);
x = [0 1-Sp 1];
y = [0 Sn 1];
plot(x,y,'-o'); hold all
title('Analysis of ROC space for different sets of features using Random Forest Classifier without noise');
legend('All','Transform','Spatial','Directional','Non-directional');
end
X = sprintf('For SVM TP = %d TN = %d FP = %d FN = %d Sn = %f Sp = %f Accuracy = %f',TP,TN,FP,FN,Sn,Sp,Accuracy);
disp(X);


%Ref: https://www.mathworks.com/matlabcentral/fileexchange/47364-true-positives--false-positives--true-negatives--false-negatives-from-2-matrices
end