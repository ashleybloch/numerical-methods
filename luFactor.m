function [L,U,P] = luFactor(A)
% This function determines the LU Factorization of a square matrix using
% partial pivoting.
%
% Inputs:
% A - coefficient matrix
% Outputs:
% L - lower triangular matrix
% U - upper triangular matrix
% P - the pivot matrix

% Check that Matrix A is a square matrix
[m,n] = size(A);
if m ~= n, error ('Matrix A must be a square Matrix'); end

L = eye(m);
U = A;
P = eye(m);

%Partial Pivotting for A and tracking it in the permutation matrix P
for k = 1:n-1
    [big,i] = max(abs(A(k:n,k)));
    ipr = i + k - 1;
    if ipr ~= k
        A([k, ipr],:) = A([ipr,k],:);
        P([k, ipr],:) = P([ipr,k],:);
    end 
end

%calculate the factors to multiply by initially
for i = k + 1:n
l21 = (A(1,2))/(A(1,1))
l31 = (A(1,3))/(A(1,1))

%multiply  the first row of U by those factors and subtract the second
%and third rows respectively to to get zeros in the first column
A(2,:) = (A(1,:) * l21) - A(2,:);
A(3,:) = (A(1,:) * l31) - A(3,:);

%add a second pivot if you need to
for k = 1:n-2
    [big, i] = max(abs(A(k:n,k)));
    ipr = i + k - 1;
    if ipr ~= k
        A([k, ipr],:) = A([ipr,k],:);
        P([k, ipr],:) = P([ipr,k],:);
    end 
end
%calculate what factor to multiply thirds row by
l32 = (A(3,2))/(A(2,2))

%multiply the second row by that factor and subtract the third tow to get
%and upper triangular matrix.
A(3,:) = (A(2,:) * l32) - A(3,:)

%Replace the values in L with the factors to get a lower triangular matrix.
L(2,1) = l21
L(3,1) = l31
L(3,2) = l32

%display final matrices
disp(A);
disp(P);
disp(L);
disp(U);


end
