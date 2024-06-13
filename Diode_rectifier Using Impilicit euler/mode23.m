function hh=mode23(method)
global i y  
vin=-12;
Vd_off = 0.7;
Ls = 10e-6;
Cd = 10e-9;
C = 1e-3;
Rser = 0.01;
Rload = 10;
Rd_off = 10e3;
Lc = 10e-9;
Rc = 1;

if (y(2, i)<Vd_off)&&(y(3, i)<0)
    s  = 0; % diode off
else
    s = 1;
end
A0 = [ (-Rser - Rload)/Ls      -1/Ls      Rload/Ls      0;
    1/Cd          -1/(Rd_off*Cd)  0      0;
    Rload/Lc         0          (-Rload - Rc)/Lc   -1/Lc;
    0            0           1/C      0];
B0 = [1/Ls 0 ;
    0     0/Rd_off*Cd;
    0          0 ;
    0          0];
u0=[vin;Vd_off];

C0 = eye(4);

if strcmp(method, 'Gear')
    modesolvegear(A0, B0, u0)
elseif strcmp(method, 'Euler')
    modesolveelr(A0, B0, u0)
elseif strcmp(method, 'Trap')
    modesolvetrap(A0, B0, u0)
else
    error('Select a valid method')
end

i=i+1;
hh=i;
   
end