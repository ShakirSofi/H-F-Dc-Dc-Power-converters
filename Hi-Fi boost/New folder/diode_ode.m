function xdot = diode_ode(t,x)  % Replace ~ by t
global A1 B1 A0 B0 u1  flag  

% Once this function is called, condition is checked and the corresponding
% ODE is solved.
% This function returns the solution for the time span
if (flag == 0 && x(2,:) > 0.7) || ( flag == 1 && x(1,:) > 0)
    flag = 1;
    
    xdot = A1*x + B1*u1;
    
        
else
    flag = 0;
    
    xdot = A0*x + B0*u1;
   
   
end

