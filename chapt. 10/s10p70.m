% Given data
bo = 62; % mm
bi = 34; % mm
ho = 70; % mm
hi = 54; % mm
L = 1.7 * 10^3; % mm
E = 73.1 * 10^3; % MPa

% Calculate cross-sectional area A
A = bo * ho - bi * hi; % mm^2

% Calculate moments of inertia Ix and Iy
Ix = (1/12) * (bo * ho^3 - bi * hi^3); % mm^4
Iy = (1/12) * (ho * bo^3 - hi * bi^3); % mm^4

% Calculate minimum moment of inertia Imin
Imin = min(Ix, Iy);

% Calculate radius of gyration r
r = sqrt(Imin / A); % mm

% Calculate slenderness ratio L/r
Lr = L / r;

% Calculate allowable stress sigma_all
sigma_all = (382 * 10^3) / (Lr^2); % MPa

% Calculate maximum allowable load Pall
Pall = sigma_all * A *1e-3; % N

% Display results
fprintf('Cross-sectional area A: %.4f mm^2\n', A);
fprintf('Moment of inertia Ix: %.4f mm^4\n', Ix);
fprintf('Moment of inertia Iy: %.4f mm^4\n', Iy);
fprintf('Radius of gyration r: %.4f mm\n', r);
fprintf('Slenderness ratio L/r: %.4f\n', Lr);
fprintf('Allowable stress sigma_all: %.4f MPa\n', sigma_all);
fprintf('Maximum allowable load Pall: %.4f N\n', Pall);
