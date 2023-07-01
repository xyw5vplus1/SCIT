clear
clc
addpath('.\dataset');addpath('.\hsicAlg');addpath('.\kcitAlg');
tic
n = 1000; % sample size
iterNum =1000;
score_Cell = cell(1,iterNum);
Alg1 = {@uni_dist,@chi2_dist,@exp_dist,@beta_dist,@t_dist};
Alg2 = {@lin_func,@sin_func,@tanh_func,@exp_func,@log_func,@sq_func,@cu_func};
parfor t = 1:iterNum % iter num
    rng(t)
    error_nonind = zeros(length(Alg1)*length(Alg2),1);
    t
    for i = 1:length(Alg1)
        A = Alg1{i}(n);
        for j = 1:length(Alg2)
            d1 = Alg2{j}(A(:,1) + A(:,2)) + A(:,7) + A(:,8);
            d2 = Alg2{j}(A(:,3) - A(:,4)) + A(:,9);
            d1 = d1 - mean(d1);
            d2 = d2 - mean(d2);
            Num1 =  FRCIT(d1,d2,[]);
%             Num2 =  SCITn(d1,d2,[]);
%             Num3 =  KCIT(d1,d2,[]);
%             Num4 =  HSCIT(d1,d2,[]);
%             Num5 =  FRCIT(d1,d2,[]);
%             Num6 =  PaCoT(d1,d2,[]);
            error_nonind((i-1)*length(Alg2)+j,:) = 1-[Num1];%,Num2,Num3,Num4,Num5,Num6];
        end
    end
    score_Cell{t} = error_nonind;
end
ave_score = get_Mean(score_Cell)
error_bar = get_errorBar(score_Cell)
toc

function data = uni_dist(n)
B = (rand(n,10)-0.5)*2; % uniform
B = B./(max(B)-min(B)); 
data = B - mean(B);
end

function data = chi2_dist(n)
B = chi2rnd(1,n,10); % chi2rnd
B = B./(max(B)-min(B)); 
data = B - mean(B);
end

function data = exp_dist(n)
B = exprnd(0.5,n,10); % exprnd
B = B./(max(B)-min(B)); 
data = B - mean(B);
end

function data = beta_dist(n)
B = betarnd(0.2,0.8,n,10); % beta
B = B./(max(B)-min(B)); 
data = B - mean(B);
end

function data = t_dist(n)
B = trnd(1,n,10); % t
B = B./(max(B)-min(B)); 
data = B - mean(B);
end

function data = lin_func(data)
end

function data = sin_func(data)
data = sin(data);
end

function data = tanh_func(data)
data = tanh(data);
end

function data = exp_func(data)
data = exp(data);
end

function data = log_func(data)
data = exp(data.^2);
end

function data = sq_func(data)
data = data.^2;
end

function data = cu_func(data)
data = data.^3;
end
