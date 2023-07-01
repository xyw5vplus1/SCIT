clc
clear
tic
addpath('.\dataset');addpath('.\hsicAlg');addpath('.\kcitAlg');
load sachs.mat;load sachs_skeleton.mat;data = sachs;load ind_table.mat; 
for i = 1:size(data,2)
    data(:,i) = data(:,i) - mean(data(:,i));
end
tic
algM = {@Darling,@KCIT,@HSCIT,@FRCIT,@PaCoT,@SCITk,@SCITn};
times = 100;
scoreCell = cell(1,times);
parfor T = 1:times
    rng(T)
    T
    score = [];
    for i = 1:size(algM,2)
        rpf = ind_check(data,ind_table,algM{i});
        score = [score;rpf];
    end
    scoreCell{T} = score; 
end
get_Mean(scoreCell)
get_errorBar(scoreCell)
toc