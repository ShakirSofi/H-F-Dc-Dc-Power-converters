function MainPrgm
clear 
clc
global y i qit k  delta 
fs=1000; vc=0.50;
ts=1/fs; tmax=10*ts; delta=ts/500;
time=0:delta:tmax;
vst=(time/ts)-fix((time/ts));
qit=(vc>vst);   
y=zeros(4,length(time));
i=1;
k=2;
method = 'Gear'; % Gear or Euler or Trap
while k<=(length(time))
        if (qit(k)==1)
            mode1(method);
      
        else
        
          mode23(method);
     
        end
          
k=k+1;
   
end
Y=y';
disp(size(y))
disp(size(time))
% SS output voltage
% Vo = vc+iLc*Rc + L delta(iLC)/dt
Vo = Y(end,4) + Y(end, 3)*1 + 10e-9*((Y(end-1, 3)-Y(end, 3))/delta); 
disp('Output voltage V_o =')
disp(Vo)
subplot(2,2,1)
    plot(time, Y(:,1), 'LineWidth', 1.2) 
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
    hold on
    title('$i$', 'Interpreter', 'latex')
    subplot(2,2,2)
    plot(time, Y(:,2), 'LineWidth', 1.2)
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
  
       title('$v_d$', 'Interpreter', 'latex')
       subplot(2,2,3)
    plot(time, Y(:,3), 'LineWidth', 1.2)
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
  
       title('$i_{Lc}$', 'Interpreter', 'latex')
       subplot(2,2,4)
    plot(time, Y(:,4), 'LineWidth', 1.2)
  
       title('$v_c$', 'Interpreter', 'latex')
   set(gca,'FontSize',15, 'FontName', 'Times New Roman')

end
