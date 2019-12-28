function [g] = left(h)
N = size(h,2);
x = zeros(1,size(h,2));
y = zeros(1,size(h,2));
for i = 1:1:N
    x(i) = -h(2,i) + h(2,5) + h(1,5);
    y(i) = h(1,i) - h(1,5) + h(2,5);
end
h = [x;y];
g = h;
