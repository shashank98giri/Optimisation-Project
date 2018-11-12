

xprev=[-10,-5];
xnew=[4,4];
step_size=0.00001;

counter=0;

function f= funcx(x)
  f=100*(( x(2) - x(1)^2 )^2)+( x(1) -1 )^2;
end

function g= grad1(x)
  g=[400*(x(1)^2 - x(2))*x(1)+2*( x(1) -1 ),
  200*( x(2)- x(1) ^2 )];
end


while(abs(funcx(xnew)-funcx(xprev))>0.0000001)
      xprev=xnew;
      grad=grad1(xprev);   
      xnew=xprev - step_size*grad;
      counter=counter+1;
end;
  
fprintf("%d \n",counter);
fprintf("%2.6f \n",funcx(xnew));
