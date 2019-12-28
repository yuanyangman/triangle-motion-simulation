function [g] = go_ahead(h,l,r)
N = 5;
if (l == 0)
    len_stp = r*N;
    h(2,:) = bsxfun(@plus,h(2,:),len_stp);
end
if (r == 0)
    len_stp = l*N;
    h(1,:) = bsxfun(@plus,h(1,:),len_stp);
end
g = h;
