clear;clc;
load score_nonind.mat;load error_nonind.mat;
m = size(score_nonind,1);n = size(score_nonind,2);
scoreM = zeros(m*5,7);errorM = zeros(m*5,7);
for i=1:5
    scoreM(1+7*(i-1):7*i,:) = score_nonind(:,1+7*(i-1):7*i);
    errorM(1+7*(i-1):7*i,:) = error_nonind(:,1+7*(i-1):7*i);
end
scoreM = [scoreM,mean(scoreM,2)];
errorM = [errorM,mean(errorM,2)];
printM = zeros(size(scoreM,1),2*size(scoreM,2));
for i = 1:2:2*size(scoreM,2)-1
    printM(:,i) = scoreM(:,i/2+1/2);
end
for j = 2:2:2*size(scoreM,2)
    printM(:,j) = errorM(:,j/2);
end
scoreM(1,:)
errorM(1,:)
printM