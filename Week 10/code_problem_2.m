% Define r and f via inline functions that can work on
% vectors of x values.
% Boundary conditions are homogeneous Dirichlet: u(0)=u(1) = 0.
% Ask user for number of subintervals.
n = input('Enter no. of subintervals n: ');
% Set up the grid.
h = 1/n;
x = [h:h:(n-1)*h]';
% Form the matrix A. Store it as a sparse matrix.
% First form the matrix corres to u'' then add in
% the terms for r(x)u.
A = sparse(diag(2*ones(n-1,1),0)+diag(-ones(n-2,1),1)+diag(-ones(n-2,1),-1));
A = (1/h)*A;
% The u' terms
a = 1000;
A = A + (a/2)*(diag(ones(n-2,1),1) + diag(-ones(n-2, 1),-1));
% The 2u terms
A = A + (2*h)*(2/3*diag(ones(n-1,1),0) + 1/6*diag(ones(n-2,1),1) + 1/6*diag(ones(n-2,1),-1));
b = h*ones(n-1, 1);
% Compute approximate solution.
u_approx = A\b;
% Compare approximate solution with true solution.
u_true = 0.5 - 0.454985*exp(-x) - 0.0450153*exp(2*x);
plot(u_approx);
%err = max(abs(u_true - u_approx))