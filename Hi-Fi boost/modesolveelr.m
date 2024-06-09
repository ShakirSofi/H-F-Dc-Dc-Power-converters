function modesolveelr(A,B,Voi)
global y i delta 
I=eye(size(A));
y(:,i+1)=(I-delta*A)\(y(:,i)+delta*B*Voi);
end
