clc;clear;addpath('.\dataset');addpath('.\hsicAlg');addpath('.\kcitAlg');
nsamples = 1000;H = [0.5 1 1.5 2]; n = length(H);
Alg = {@SCITk,@PaCoT};
% Alg = {@SCITk,@SCITn,@Darling,@ReCIT,@HSCIT,@FRCIT,@PaCoT};
m = length(Alg);
%-------------Score Matrix: s1 ~ type I error, s2 ~ type II error
Times = 8; % times
Type1_Cell = cell(1,Times);
Type2_Cell = cell(1,Times);
tic
parfor T = 1:Times % 1000 times
    T
    M_Type1 = zeros(n*m,5);M_Type2 = zeros(n*m,5);
    %-------------data generating Case II
    for i = 3:5 % |Z| = 5
        z  = rand(nsamples,i)-0.5;ny = rand(nsamples,1)-0.5;nx = rand(nsamples,1)-0.5;y = 0;x = 0;
        for t = 1:i;x = x + z(:,t);y = y + z(:,t);end
        for j = 1:n
            X = H(j)*x/(max(x)-min(x)) + nx/(max(nx)-min(nx));
            Y = H(j)*y/(max(y)-min(y)) + ny/(max(ny)-min(ny));
            %-------------Type I error
%             conset = z;
%             for k = 1:m
%                 M_Type1(k+(j-1)*m,i) = M_Type1(k+(j-1)*m,i) +  Alg{k}(X,Y,conset);
%             end
            %--------------Type II error ----------------------
            randID = randperm(i-1)+1;
            if i == 1
                conset = [];
            else
                conset = z(:,randID(1:i-1));
            end
            for k = 1:m
                M_Type2(k+(j-1)*m,i) = M_Type2(k+(j-1)*m,i) +  Alg{k}(X,Y,conset);
            end
        end
    end
    %-------------Results
%     Type1_Cell{T} = 1 - M_Type1;
    Type2_Cell{T} = M_Type2;
end
% ave_score1 = get_Mean(Type1_Cell)
% error_bar1 = get_errorBar(Type1_Cell)
ave_score2 = get_Mean(Type2_Cell)
error_bar2 = get_errorBar(Type2_Cell)
toc