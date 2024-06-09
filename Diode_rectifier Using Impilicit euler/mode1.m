function gg=mode1(method)
global i   
Vd_on = 0.7;
Ls = 10e-6;
Cd = 10e-9;
C = 1e-3;
Rser = 0.01;
vin=12;
Rload = 10;
Rd_on = 0.05;
Lc = 10e-9;
Rc = 1;
A1 = [ (-Rser - Rload)/Ls      -1/Ls      Rload/Ls      0;
    1/Cd          -1/(Rd_on*Cd)  0      0;
    Rload/Lc         0          (-Rload - Rc)/Lc   -1/Lc;
    0            0           1/C      0];
B1 = [1/Ls 0 ;
    0     1/(Rd_on*Cd);
    0          0 ;
    0          0];


C1 = eye(4);


D1 = zeros(4,2);
 
u1=[vin;Vd_on];

if strcmp(method, 'Gear')
    modesolvegear(A1, B1, u1)
elseif strcmp(method, 'Euler')
    modesolveelr(A1, B1, u1)
elseif strcmp(method, 'Trap')
    modesolvetrap(A1, B1, u1)
else
    error('Select a valid method')
end
   
 i=i+1;
end