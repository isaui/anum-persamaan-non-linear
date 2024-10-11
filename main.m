clear all;
close all;
clear functions;

% Definisi fungsi dan turunannya
f = @(x) log(x.^2 + 1) - exp(x).*cos(x);
df = @(x) 2*x/(x.^2 + 1) - exp(x)*(cos(x) - sin(x));

fprintf('Evaluasi fungsi pada range -2 sampai 4:\n');
for x = -2:1:4
    fx = f(x);
    fprintf('f(%.1f) = %.7f\n', x, fx);
end

% Set parameters
a = -1;
b = 0;
max_iter = 10;
tol = 1e-4;

% Metode Bisection
[root_bisection, iterations_bisection, log_bisection] = bisection(f, a, b, max_iter, tol);

fprintf('\nMetode Bisection\n');
fprintf('Persamaan: ln(x^2 + 1) - e^x cos(x) = 0\n');
fprintf('Akar yang ditemukan: %.7f\n', root_bisection);
fprintf('Jumlah iterasi: %d\n', iterations_bisection);
fprintf('Nilai fungsi pada akar: %.7e\n\n', f(root_bisection));

% Display log Bisection
fprintf('Iterasi\t   a\t\t   b\t\t   c\t\t f(c)\t\t |b-a|\n');
fprintf('-----------------------------------------------------------------------\n');
for i = 1:size(log_bisection, 1)
    fprintf('%d\t%.7f\t%.7f\t%.7f\t%.7e\t%.7e\n', log_bisection(i,:));
end

% Metode Newton-Raphson
x0 = (a + b) / 2;  % Titik awal (midpoint dari interval Bisection)
[root_newton, iterations_newton, log_newton] = newton_raphson(f, df, x0, max_iter, tol);

fprintf('\nMetode Newton-Raphson\n');
fprintf('Persamaan: ln(x^2 + 1) - e^x cos(x) = 0\n');
fprintf('Akar yang ditemukan: %.7f\n', root_newton);
fprintf('Jumlah iterasi: %d\n', iterations_newton);
fprintf('Nilai fungsi pada akar: %.7e\n\n', f(root_newton));

% Display log Newton-Raphson
fprintf('Iterasi\t   x\t\t   f(x)\t\t   f''(x)\n');
fprintf('--------------------------------------------------\n');
for i = 1:size(log_newton, 1)
    fprintf('%d\t%.7f\t%.7e\t%.7e\n', log_newton(i,:));
end

% Perbandingan hasil
fprintf('\nPerbandingan Hasil:\n');
fprintf('Metode\t\tAkar\t\tIterasi\tNilai f(x) pada akar\n');
fprintf('Bisection\t%.7f\t%d\t%.7e\n', root_bisection, iterations_bisection, f(root_bisection));
fprintf('Newton-Raphson\t%.7f\t%d\t%.7e\n', root_newton, iterations_newton, f(root_newton));