clear;clc;
load score_ind.mat;load error_ind.mat;
m = size(score_ind,1);n = size(score_ind,2);
M = zeros(m,n*2);
for i = 1:2:2*n-1
    M(:,i) = score_ind(:,i/2+1/2);
end
for j = 2:2:2*n
    M(:,j) = error_ind(:,j/2);
end
for k = 1:5
    Mcell{k} =  M(:,1+14*(k-1):14+14*(k-1));
end
meanM = get_Mean(Mcell);s = size(meanM,2);
meanM(:,s+1) = (meanM(:,1) + meanM(:,3) +meanM(:,5) +meanM(:,7) +meanM(:,9) +meanM(:,11) + meanM(:,13))/7;
meanM(:,s+2) = (meanM(:,1+1) + meanM(:,3+1) +meanM(:,5+1) +meanM(:,7+1) +meanM(:,9+1) +meanM(:,11+1) + meanM(:,13+1))/7;
meanM  % latex ind