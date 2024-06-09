function MainPrgm
clear 
clc
set(0,'defaulttextinterpreter','Latex');
global y i qit k  delta
fs=50e3; vc=0.50;
ts=1/fs; tmax=10*ts; delta=10^(-3)*ts;
time=0:delta:tmax;
vst=(time/ts)-fix((time/ts));
qit=(vc>vst);
y=zeros(6,length(time));
i=2;
k=1;
tic
while k<=(length(time))
        if (qit(k)==1)
            
            mode1();
      
        else
        
          mode23();
     
        end
          
k=k+1;
   
end
toc
Y=y';

    subplot(3,2,1)
    plot(Y(:,1),'b') 
    title('Inductor Current ')
    
    subplot(3,2,2)
   plot(Y(:,2),'b')
    title('Capacitor Voltage')
    
     subplot(3,2,3)
     plot(Y(:,3),'k')
     title('switch-inductor current ')
     
      subplot(3,2,4)
       plot(Y(:,4),'b')
      title('switch-capacitor Voltage')
      subplot(3,2,5)
       plot(Y(:,5),'b')
      title('output-inductor current')
      subplot(3,2,6)
       plot(Y(:,6),'b')
      title('diode-capacitor Voltage ')
   
end
