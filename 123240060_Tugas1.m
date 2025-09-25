% Nama: Wildan Rifqi Prambudi
% NIM: 123240060
% Kelas: IF-F
%
% Soal:
% 1. x^2 + 4x - 21 = 0 → cari akar positif
% 2. x^3 - 5x^2 - x + 5 = 0 → cari akar negatif

clc; clear; format long;

function root = bisection(f, a, b, tol, max_iter)
    if f(a)*f(b) > 0
        error('Bisection gagal: f(a) dan f(b) tidak berbeda tanda');
    end
    for i = 1:max_iter
        c = (a+b)/2;
        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        if abs(f(c)) < tol || (b-a)/2 < tol
            root = c;
            fprintf('Bisection iterasi %d: akar ≈ %.8f\n', i, root);
            return;
        end
    end
    root = (a+b)/2;
    fprintf('Bisection mencapai iterasi maksimum, akar ≈ %.8f\n', root);
end

function root = regula_falsi(f, a, b, tol, max_iter)
    if f(a)*f(b) > 0
        error('Regula Falsi gagal: f(a) dan f(b) tidak berbeda tanda');
    end
    for i = 1:max_iter
        c = (a*f(b) - b*f(a)) / (f(b) - f(a));
        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        if abs(f(c)) < tol
            root = c;
            fprintf('Regula Falsi iterasi %d: akar ≈ %.8f\n', i, root);
            return;
        end
    end
    root = (a*f(b) - b*f(a)) / (f(b) - f(a));
    fprintf('Regula Falsi mencapai iterasi maksimum, akar ≈ %.8f\n', root);
end


fprintf('\n=== Soal 1: x^2 + 4x - 21 = 0 (akar positif) ===\n');
f1 = @(x) x.^2 + 4*x - 21;

a1 = 0; b1 = 10;

akar_bisec1 = bisection(f1, a1, b1, 1e-6, 100);
akar_rf1    = regula_falsi(f1, a1, b1, 1e-6, 100);

fprintf('Hasil Bisection: %.8f\n', akar_bisec1);
fprintf('Hasil Regula Falsi: %.8f\n', akar_rf1);

fprintf('\n=== Soal 2: x^3 - 5x^2 - x + 5 = 0 (akar negatif) ===\n');
f2 = @(x) x.^3 - 5*x.^2 - x + 5;

a2 = -5; b2 = 0;

akar_bisec2 = bisection(f2, a2, b2, 1e-6, 100);
akar_rf2    = regula_falsi(f2, a2, b2, 1e-6, 100);

fprintf('Hasil Bisection: %.8f\n', akar_bisec2);
fprintf('Hasil Regula Falsi: %.8f\n', akar_rf2);

