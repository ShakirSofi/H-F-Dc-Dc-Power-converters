function hh=mode23(method)
global i y 
vin=10;
Vd_off = 0.61;
RL=0.1; L=100e-6;   Ls=20e-9;  Rsoff=2e6; Cs=200e-12; Cdon=15e-12; Rdon=50e-3; Rc=0.4; Lc=100e-12; C=42e-6;
Ro= 20;

if (y(3,i)<= 0 && y(2, i)>Vd_off)
    s  = 1; % diode on
else
    s = 0;
end

A0 = [ (-RL - Ro)/L  0  Ro/L  0  Ro/L  -1/L ;
             0  0  0  0  1/C 0;
             Ro/Ls  0  -Ro/Ls  -1/Ls  -Ro/Ls  1/Ls;
             0  0  1/Cs  -1/(Cs*Rsoff)  0  0;
             Ro/Lc  -1/Lc  -Ro/Lc  0  (-Rc-Ro)/Lc  0;
             1/Cdon  0  -1/Cdon  0  0  -1/(Cdon*Rdon)];
B0 = [1/L  0 ;
    0  0;
    0  0 ;
    0  0;
    0  0;
    0 s/(Cdon*Rdon)];


C0 = eye(6);


D0 = zeros(6,2);
 
u0=[vin;Vd_off];

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