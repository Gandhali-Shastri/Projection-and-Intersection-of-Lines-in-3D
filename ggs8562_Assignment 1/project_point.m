% Write a MATLAB function,Q = projectpoint(P), that computes the projection Q on the image plane of a given pointP. 
% Apply this function to each of the given pointsin a MATLAB script.  

% References: https://www.khanacademy.org/partner-content/psub_xar/rendering/rendering-2/e/ray-intersection-with-plane
function Q = project_point(P)
C= [0,0,0];

syms t a b c;

sub_x = (1-t)*C(1) + t *P(1);
sub_y = (1-t)*C(2) + t *P(2);
sub_z = (1-t)*C(3) + t *P(3);

x=0;
y=0;
z=1;

%line equation ax + by + c =0
eq = a*x + b*y + c*z - 1;

%substitute the values of abc and sub x y z
e = subs(eq,[a,b,c], [sub_x,sub_y,sub_z]);

sol = solve(e,t);

val_x= subs(sub_x,t,sol);
val_y= subs(sub_y,t,sol);
val_z= subs(sub_z,t,sol);

Q= [val_x,val_y,val_z];

end