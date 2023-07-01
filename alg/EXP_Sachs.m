clc
clear
addpath('.\dataset');addpath('.\kcitAlg');
load sachs.mat;load sachs_skeleton.mat;data = sachs;load ind_table.mat; 
for i = 1:size(data,2)
    data(:,i) = data(:,i)/(max(data(:,i))-min(data(:,i)));
    data(:,i) = data(:,i) - mean(data(:,i));
end
tic
algM = {@SCITk,@SCITn,@ReCIT};
for T = 1:1000
    printT = T
    score = [];
    for i = 1:size(algM,2)
        struC = get_stru_full(data,1,algM{i});
        for p = 1:size(data,2)
            for q = 1:size(data,2)
                if struC(p,q) == 1 && struC(q,p) == 1
                    struC(q,p) = 0;
                end
            end
        end
        rpf = getRPF_stru(struC,skeleton);
        shd = get_SHD(struC,skeleton);
        score = [score;[rpf,shd]];
    end
    scoreCell{T} = score; % to calculate error bar
    if T == 1
        scoreM = zeros(size(score,1),size(score,2));
    end
    scoreM = [scoreM + score];
    printScore = scoreM/T % average score
    toc
end