% Full Model of Diode Rectifier Circuit with Square Wave Input
% Using ODE Solvers

close;
clear
clc

global A1 B1 A0 B0 u1 flag x
vin=5;
Vd_on = 0.7;
RL=0.1; L=20e-6;   Ls=20e-9; Rsoff=2e6;Cdon=100e-12;Rdon=40e6; Rson=0.2; Cs=200e-12; Cdoff=15e-12; Rdoff=50e-3; Rc=0.4; Lc=100e-12; C=42e-6;
Ro= 20;
%ON
A1 = [ (-RL - Ro)/L  0  Ro/L  0  Ro/L  -1/L ;
             0  0  0  0  1/C 0;
             Ro/Ls  0  -Ro/Ls  -1/Ls  -Ro/Ls  1/Ls;
             0  0  1/Cs  -1/(Cs*Rson)  0  0;
             Ro/Lc  -1/Lc  -Ro/Lc  0  (-Rc-Ro)/Lc  0;
             1/Cdon  0  -1/Cdon  0  0  -1/(Cdon*Rdon)];
B1 = [1/L  0 ;
    0  0;
    0  0 ;
    0  0;
    0  0;
    0 1/(Cdon*Rdon)];


C1 = eye(6);


D1 = zeros(6,2);
%OFF------------------------------
A0 = [ (-RL - Ro)/L  0  Ro/L  0  Ro/L  -1/L ;
             0  0  0  0  1/C 0;
             Ro/Ls  0  -Ro/Ls  -1/Ls  -Ro/Ls  1/Ls;
             0  0  1/Cs  -1/(Cs*Rsoff)  0  0;
             Ro/Lc  -1/Lc  -Ro/Lc  0  (-Rc-Ro)/Lc  0;
             1/Cdoff  0  -1/Cdoff  0  0  -1/(Cdoff*Rdoff)];
B0 = [1/L  0 ;
    0  0;
    0  0 ;
    0  0;
    0  0;
    0 0/(Cdoff*Rdoff)];


C0 = eye(6);


D0 = zeros(6,2);
%------------------------
% Initial Conditions

vd = 0;
i = 0;

options=odeset('AbsTol',1e-6);
x0 = [0;0;0;0;0;0];
flag = 0;

idx_seg = 0;
t_start = 0;
t = t_start;
x = x0;



%The 'diode_ode' is a separate file. The output is returned in the form of
%[t_sol,x_sol] for the positive and negative half of the square wave.
%The solutions are then accumulated in t and x below & the process is
%repeated for the number of cycles required. Here (1:10):

t_seg = (1:10)*1e-3;
tic
while idx_seg < length(t_seg)
    idx_seg = idx_seg+1;
    t_end = t_seg(idx_seg);
    u1 = [5;0.7];
    [t_sol1, x_sol1] = ode15s('diode_ode',[t_start,(t_start+t_end)/2], x0,options);
    u1 = [-12;0.7];
    x0 = x_sol1(end,:)';
    [t_sol2, x_sol2] = ode15s('diode_ode',[(t_start+t_end)/2,t_end], x0,options);
    
    ta = [t_sol1;t_sol2];
    xa = [x_sol1;x_sol2];
    t = [t  ta(2:end)'];
    x = [x  xa(2 : end, :)'];
    t_start = t_end;
    x0 = x(:,end);
end
toc
%options=odeset('RelTol',1e-6,'Stats','on');

subplot(2,1,1)
plot(t, x(1,:))


subplot(2,1,2)
plot(t, x(2,:))





