function gg=mode1(method)
global i   
vin=10;
Vd_on = 0.61;
RL=0.1; L=100e-6;   Ls=20e-9;  Rson=0.2; Cs=200e-12; Cdoff=100e-12; Rdoff=40e6; Rc=0.4; Lc=100e-12; C=42e-6;
Ro= 20;

A1 = [ (-RL - Ro)/L  0  Ro/L  0  Ro/L  -1/L ;
             0  0  0  0  1/C 0;
             Ro/Ls  0  -Ro/Ls  -1/Ls  -Ro/Ls  1/Ls;
             0  0  1/Cs  -1/(Cs*Rson)  0  0;
             Ro/Lc  -1/Lc  -Ro/Lc  0  (-Rc-Ro)/Lc  0;
             1/Cdoff  0  -1/Cdoff  0  0  -1/(Cdoff*Rdoff)];
B1 = [1/L  0 ;
    0  0;
    0  0 ;
    0  0;
    0  0;
    0 0/(Cdoff*Rdoff)];


C1 = eye(6);


D1 = zeros(6,2);
 
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