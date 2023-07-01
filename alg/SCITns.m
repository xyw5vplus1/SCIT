function [ind] = SCITns(x,y,z)
if ~isempty(z)
    M = (eye(size(x,1))-z*((z'*z)^-1)*z');
    x = M*x;
    y = M*y;
end
ind = double(py.scitns.main_scitn(x,y));

