clear
clc
tic
ind = [0 0];
time = 1000;
parfor t = 1:time
    A = (rand(1000,10)-0.5)*2; % uniform
    x = A(:,1) + A(:,2) + A(:,7) + A(:,8);
    y = A(:,1) - A(:,2) + A(:,9);
    ind = ind + [SCITn100(x,y,[]),ReCIT(x,y,[])]
end
ind = ind/time
toc

% 20       0.7130    0.6780    0.4370
%100