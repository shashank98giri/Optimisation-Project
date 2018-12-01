
% Just change the function definition to any other function( funcx) you want and also change the 
% corresponding gradient (grad1) definition according to your function.
% After running the code you will get the iteration count to reach the minima and also the function value at that point.


xprev=[-10,-5];
xnew=[4,4];

dim=2;
G=zeros(1,dim);
prev=.00000001;
step_sz=.00001;
counter=0;
epsilon=0.0000001;
function f= funcx(x)
  f=100*(( x(2) - x(1)^2 )^2)+( x(1) -1 )^2;
end

function g= grad1(x)
  g=[400*(x(1)^2 - x(2))*x(1)+2*( x(1) -1 ),
  200*( x(2)- x(1) ^2 )];
end

while(abs(funcx(xnew)-funcx(xprev))>epsilon)
      xprev=xnew;
      grad=grad1(xprev);
      G=0.9*G+0.1*grad.* grad;
      xnew=xprev-step_sz*grad./(sqrt(G)+prev);      
      counter=counter+1;
end;  
fprintf("%d \n",counter);
fprintf("%2.6f \n",funcx(xnew));
