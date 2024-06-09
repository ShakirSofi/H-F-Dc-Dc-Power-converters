function modesolvegear(A,B,Voi)
global y i delta 
I=eye(size(A));
if (i<=2)
   y(:,i+1)=(I-delta*A)\(y(:,i)+delta*B*Voi); 
else
y(:,i+1)=(I-(2*delta*A)/3)\((4/3)*y(:,i)-(1/3)*y(:,i-1)+((2*delta)/3)*B*Voi);
end

end
