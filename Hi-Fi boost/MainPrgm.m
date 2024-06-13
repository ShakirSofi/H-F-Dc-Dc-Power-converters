function MainPrgm
clear 
close
clc
set(0,'defaulttextinterpreter','Latex');
global y i qit k  delta
fs=50e3; vc=0.50;
ts=1/fs; tmax=100*ts; delta=10^(-3)*ts;
time=0:delta:tmax;
vst=(time/ts)-fix((time/ts));
qit=(vc>vst);
y=zeros(6,length(time));
i=2;
k=1;
method = 'Euler'; % Gear or Euler or Trap
tic
while k<=(length(time))
   if (qit(k)==1)
            
         mode1(method);
      
   else
        
          mode23(method);
     
   end
          
k=k+1;
   
end
toc
Y=y';
 
Vo = Y(end,2) + Y(end, 5)*0.4 + 100e-12*((Y(end-1, 5)-Y(end, 5))/delta); % nearly Vo = vc+iLc*Rc + L delta(iLC)/dt
disp(Vo)

    subplot(3,2,1)
    plot(time, Y(3:end,1), 'LineWidth', 1.2) 
    title('$i$')
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
    
    subplot(3,2,2)
   plot(time, Y(3:end,2), 'LineWidth', 1.2)
    title('$v_c$')
    set(gca,'FontSize',15, 'FontName', 'Times New Roman')
    
     subplot(3,2,3)
    plot(time, Y(3:end,3), 'LineWidth', 1.2)
     title('$i_{Ls}$')
     set(gca,'FontSize',15, 'FontName', 'Times New Roman')

      subplot(3,2,4)
      plot(time, Y(3:end,4), 'LineWidth', 1.2)
      title('$v_{cs}$')
      set(gca,'FontSize',15, 'FontName', 'Times New Roman')

      subplot(3,2,5)
       plot(time, Y(3:end,5), 'LineWidth', 1.2)
      title('$i_{Lc}$')
      set(gca,'FontSize',15, 'FontName', 'Times New Roman')

      subplot(3,2,6)
       plot(time, Y(3:end,6), 'LineWidth', 1.2)
      title('$v_d$')
      set(gca,'FontSize',15, 'FontName', 'Times New Roman')   
end
