

xprev=[-10,-5];
xnew=[4,4];

beta1=.9;
beta2=.99;
alpha=.01;
t=0;
mprev=0;
vprev=0;
prev=0.00000001;
counter=0;
function f= funcx(x)
   f=100*(( x(2) - x(1)^2 )^2)+( x(1) -1 )^2;
end

function g=grad(x)
  g=[400*(x(1)^2 - x(2))*x(1)+2*( x(1) -1 ),
  200*( x(2)- x(1) ^2 )];
end
  
  while(abs(funcx(xnew)-funcx(xprev))>0.0000001)
      counter=counter+1;
      xprev=xnew;
      t=t+1;
      g=grad(xprev);
      mnew=beta1*mprev+(1-beta1)*g;
     % disp(g);
      vnew=max(beta2*vprev+(1-beta2)*(abs(g)));
      mcorr=mnew/(1-(beta1^t));
      vcorr=vnew/(1-(beta2^t));
      xnew=xprev-alpha*mcorr ./ (vcorr+prev);
      vprev=vnew;
      mprev=mnew;
  end;
    
  fprintf("%d\n",counter);
  fprintf("%2.6f\n",funcx(xprev));
