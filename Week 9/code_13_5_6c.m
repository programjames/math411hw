L = chebop(0, 1);
L.op = @(x,u) diff(u, 2) - u;
L.lbc = 0;
L.rbc = 0;
f=chebfun('x.^2', [0, 1]);
u = L\x;
norm(L(u)-f, inf)
length(u)
plot(u, '.-')