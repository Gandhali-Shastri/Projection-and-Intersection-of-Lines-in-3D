%  write a MATLAB functionQ = findintersection(P11, P12,P21, P22)that takes as input two points from each line,L1andL2, 
% and computes the point of intersectionQof  the  lines  projected  on  the  image  plane

% Reference: https://www.youtube.com/watch?v=LxDM5-wRAzI&t=399s
%            https://math.stackexchange.com/questions/28503/how-to-find-intersection-of-two-lines-in-3d

function Q = find_intersection(pt1,pt2,pt3,pt4)

pt1 = project_point(pt1);
pt2 = project_point(pt2);
pt3 = project_point(pt3);
pt4 = project_point(pt4);

syms t s

%r=c +ta parametric form
r1 = pt1 + t * (pt2 - pt1);
r2 = pt3 + s * (pt4 - pt3);

%gaussian
gaus = [r1(1,1) == 0, r1(1,2) == 0, r2(1,1) == 0, r2(1,2) == 0];
sol = solve(gaus);

%substitute t in original eqn
Q = subs(r1, t, sol.t);
%disp(sol);

fplot3(r1(:,1),r1(:,2),r1(:,3));
hold on
fplot3(r2(:,1),r2(:,2),r2(:,3));


end