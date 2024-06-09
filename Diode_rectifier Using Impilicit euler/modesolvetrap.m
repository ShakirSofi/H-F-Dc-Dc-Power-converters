function modesolvetrap(A,B,Voi)
global y i delta 
I=eye(size(A));
y(:,i+1)=(I-0.5*delta*A)\(I+0.5*delta*A)*(y(:,i))+((I-0.5*delta*A)\(delta*B))*Voi;

end
