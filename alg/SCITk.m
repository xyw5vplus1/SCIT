function [ind] = SCITk(x,y,z)
n = length(x);
ind = 0;
k = 100;
alpha = 0.05;
if ~isempty(z)
    M = (eye(size(x,1))-z*((z'*z)^-1)*z');
    sumYX = mean(exp(-2*(M*(y - x)).^2));
else
    M = 0;
    sumYX = mean(exp(-2*((y - x)).^2));
end
sumYZ = zeros(1,k);
temp = 0;
for i = 1:k
    if M == 0
        sumYZ(i) = mean(exp(-2*(x-y(randperm(n))).^2));
        if sumYZ(i) > sumYX
            temp = temp + 1;
            if temp/k >= alpha
                ind = 1;
                return
            end
        end
    else
        sumYZ(i) = mean(exp(-2*(M*x-M(randperm(n),:)*y).^2));
        if sumYZ(i) > sumYX
            temp = temp + 1;
            if temp/k >= alpha
                ind = 1;
                return
            end
        end
    end
end
end
