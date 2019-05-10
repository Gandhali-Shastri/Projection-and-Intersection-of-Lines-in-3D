%(i)x?1 = 0 andx= 0,(ii) 3x+ 2z?1 = 0 and 3x+ 2z?2 = 0, (iii) 5x?2z?1 = 0 and 5x?2z?2 = 0. 
%y =-1
function pairwiseintersection

P11 = [1,-1,1];
P12 = [0,-1,-1];

P21 = [0,-1,1/2];
P22 = [0,-1,1];

P31 = [0,-1,-1/2];
P32 = [0,-1,-1];


l1_2 = find_intersection(P11,P12,P21,P22);
l1_3 = find_intersection(P11,P12,P31,P32);
l2_3 = find_intersection(P21,P22,P31,P32);

legend('line 1','line 2','line 3')
end