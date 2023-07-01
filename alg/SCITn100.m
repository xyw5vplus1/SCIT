function [ind] = SCITn100(x,y,z)
ind = 0;
k = 100;
alpha = 0.05;
if ~isempty(z)
    M = (eye(size(x,1))-z*((z'*z)^-1)*z');
    x = M*x;
    y = M*y;
end
score = py.scitn.main_scitn(x,y);
n = length(x);
scoreM = zeros(1,k);
temp = 0;
for i = 1:k
    scoreM(i) = py.scitn.main_scitn(x,y(randperm(n)));
    if scoreM(i) > score
        temp = temp + 1;
        if temp/k >= alpha
            ind = 1;
            return
        end
    end
end


