// Q4: Legendre orthogonality & Bessel functions

// Legendre Pn(x) via recursion
function P = legP(n, x)
    if n==0 then P = ones(1,length(x));
    elseif n==1 then P = x;
    else
        P = ((2*n-1)*x.*legP(n-1,x) - (n-1)*legP(n-2,x))/n;
    end
endfunction

x = -1:0.01:1;

// Orthogonality check: integral of P2*P3
I = inttrap(x, legP(2,x).*legP(3,x));
disp('∫P2·P3 dx = ' + string(I) + ' (should be ~0)');

// Plot first 4 Legendre polynomials
clf(); subplot(1,2,1);
for n = 0:3
    plot(x, legP(n,x));
end
legend('P0','P1','P2','P3');
title('Legendre Polynomials'); xgrid();

// Plot Bessel functions j0, j1, j2
subplot(1,2,2);
xb = 0:0.1:15;
for m = 0:2
    plot(xb, besselj(m, xb));
end
legend('J0','J1','J2');
title('Bessel Functions Jₙ(x)'); xgrid();
