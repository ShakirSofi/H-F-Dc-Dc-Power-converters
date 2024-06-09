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
k=1;
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


subplot(2,2,1)
    plot(time, Y(1:end-1,1), 'LineWidth', 1.2) 
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
    hold on
    title('$i$', 'Interpreter', 'latex')
    subplot(2,2,2)
    plot(time, Y(1:end-1,2), 'LineWidth', 1.2)
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
  
       title('$v_d$', 'Interpreter', 'latex')
       subplot(2,2,3)
    plot(time, Y(1:end-1,3), 'LineWidth', 1.2)
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
  
       title('$i_{Lc}$', 'Interpreter', 'latex')
       subplot(2,2,4)
    plot(time, Y(1:end-1,4), 'LineWidth', 1.2)
  
       title('$v_c$', 'Interpreter', 'latex')
   set(gca,'FontSize',15, 'FontName', 'Times New Roman')

end
