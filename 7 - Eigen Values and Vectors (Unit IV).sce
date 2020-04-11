clc
funcprot(0)   //if variables are redefined do nothing
format('v',10)

A = input("Enter a matrix A[3x3]: ");

lam = poly(0,'lam');
lam = lam;
charMat = A-lam*eye(3,3);
disp(charMat,'The Characteristic Matrix is -> ');
charPoly = poly(A,'lam');
disp(charPoly,'The Characteristic Polynomial is -> ');
lam = spec(A);
disp(lam,'The Eigen Values of A are -> ');
function[x,lam] = eigenvectors(A)
    [n,m] = size(A);
    lam = spec(A)';
    x = [];
    for k=1:3
        b = A-lam(k)*eye(3,3); //characteristic matrix
        c = b(1:n-1,1:n-1); 
        b1 =-b(1:n-1,n); 
        y = c\b1; 
        y = [y:1]; //complete eigen vector
        y = y/norm(y); 
        x = [x y];
    end
endfunction

get f('eigenvectors');
[x,lam] = eigenvectors(A);
disp(x,'The Eigen Vectors of A are -> ');
