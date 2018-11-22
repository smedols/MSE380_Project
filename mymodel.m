function xdot = mymodel(t,x)
    global L;
    global C;
    global u;
    A=[ 0 -1/L; 1/C 0];   B=[ 1/L ; 0 ];
    C=[ 0 1 ];            D=0;
    
    xdot= A*x + B*u;
end
