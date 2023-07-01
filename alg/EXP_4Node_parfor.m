clc
clear
nsamples = [25 50 100 200 400 800]; consize = 2; % max conditional size = 4-2 = 2
func{1} = @PC_sklearn_SCITk; 
func{2} = @PC_sklearn_SCITn; 
func{3} = @PC_sklearn_KCIT;
Times = 8; % times
parfor T = 1:Times % 1000 times
    T
    rng(T)
    for n = 1:length(nsamples) 
        [skeleton,data] = gen4nodes(nsamples(n)); % get data and skeleton
        for i = 1:size(func,2)
            tic;
            Cskeleton = func{i}(data,consize); 
            tB = toc;
            if i == 1
                rpf = [getRPF(Cskeleton,skeleton),tB]; 
            else
                rpf = [rpf;[getRPF(Cskeleton,skeleton),tB]]; 
            end
        end
        if n == 1
            rpfs = rpf; 
        else
            rpfs = [rpfs,rpf];
        end
    end
    rpfs_Cell{T} = rpfs;
end
ave_rpfs = get_Mean(rpfs_Cell)
errorBar = get_errorBar(rpfs_Cell)
ave_rpfs(:,[4,8,12,16,20,24])
errorBar(:,[4,8,12,16,20,24])

function [skeleton,data] = gen4nodes(nsamples)
n = 4; % 4 nodes
skeleton = zeros(n,n);
Acell = cell(1,7);
Bcell = cell(1,3);
Acell{1} = 2;
Acell{2} = 3;
Acell{3} = 4;
Acell{4} = [2,3];
Acell{5} = [2,4];
Acell{6} = [3,4];
Acell{7} = [2,3,4];
Bcell{1} = 3;
Bcell{2} = 4;
Bcell{3} = [3,4];
ch1 = randperm(7);
ch1 = ch1(1);
skeleton(1,Acell{ch1})=1;
ch2 = randperm(3);
ch2 = ch2(1);
skeleton(2,Bcell{ch2})=1;
if rand > 0.5
    skeleton(3,4)=1;
end
[data] = genData(skeleton,nsamples);
end

function[data]=genData(skeleton,nsamples)
[dim, ~]=size(skeleton);
data = rand(nsamples, dim)*2-1;
for k = 1:dim
    data(:,k) = data(:,k) - mean(data(:,k));
end
for i=1:dim
    parentidx=find(skeleton(:,i)==true);
    for j=1:length(parentidx)
        if parentidx(j)==i
            parentidx(j)=[];
        end
    end
    if ~isempty(parentidx)
        pasample = 0;
        for w = 1:length(parentidx)
            pasample = pasample + data(:, parentidx(w))*(rand*0.8+0.2);
        end
        n =  (rand(nsamples,1)*2-1)*0.2;
        n = n - mean(n);
        data(:, i)= pasample + n;
    end
end
end