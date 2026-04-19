// Q6: Least squares linear fitting
x = [1, 2, 3, 4, 5, 6, 7, 8];
y = [2.1, 3.9, 6.2, 7.8, 10.1, 12.0, 14.1, 15.9];
N = length(x);

// Manual calculation
Sx = sum(x); Sy = sum(y);
Sxx = sum(x.^2); Sxy = sum(x.*y);
m = (N*Sxy - Sx*Sy) / (N*Sxx - Sx^2);
c = (Sy - m*Sx) / N;
disp('Manual: slope='+string(m)+' intercept='+string(c));

// Scilab polyfit (computer method)
p = polyfit(x, y, 1);
disp('polyfit: slope='+string(p(1))+' intercept='+string(p(2)));

y_fit = m*x + c;
SS_res = sum((y - y_fit).^2);
SS_tot = sum((y - mean(y)).^2);
R2 = 1 - SS_res/SS_tot;
disp('R² = ' + string(R2));

plot(x, y, 'ro', x, y_fit, 'b-');
legend('Data', 'Fit: y='+string(m)+'x+'+string(c));
xlabel('x'); ylabel('y');
title('Least Squares Fit'); xgrid();
