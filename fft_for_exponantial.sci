// Q8: FFT of Gaussian e^(-x²)
N = 1024;
dx = 0.02;
x = ((0:N-1) - N/2) * dx;

f = exp(-x.^2);

// Compute FFT and shift
F = fftshift(fft(f)) * dx;
k = ((0:N-1) - N/2) / (N*dx);  // frequency axis

F_exact = sqrt(%pi) * exp(-%pi^2 * k.^2);

clf(); subplot(2,1,1);
plot(x, f, 'b-');
xlabel('x'); ylabel('f(x)');
title('Gaussian: e^(-x²)'); xgrid();

subplot(2,1,2);
plot(k, real(F), 'r-', k, F_exact, 'b--');
xlim([-3, 3]);
legend('FFT (numerical)', 'Exact: √π·e^(-π²k²)');
xlabel('k (frequency)'); ylabel('F(k)');
title('FFT of Gaussian'); xgrid();
