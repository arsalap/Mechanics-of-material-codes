% Given data
L_effective = 21 * 12; % effective length in inches
x = 0.606; % distance in inches
d = 3.5 - x; % distance in inches
sigma_y = 36; % yield stress in ksi
E = 29e6; % modulus of elasticity in psi
A_c10x20 = 5.87;
Ix_c10x20=78.9;
Iy_c10x20= 2.80;
% Column properties
A = 2 * A_c10x20; % total area in in^2
Ix = 2 * Ix_c10x20; % total moment of inertia about the x-axis in in^4
Iy = 2 * (2.81 + A_c10x20 * d^2); % total moment of inertia about the y-axis in in^4

% Radius of gyration
r = sqrt(min([Ix, Iy]) / A);

% Effective slenderness ratio
L_over_r = L_effective / r;

% Critical slenderness ratio
L_over_r_critical = 4.71 * sqrt(E / (sigma_y * 1e3));

% Calculate sigma_e
sigma_e = pi^2 * E *1e-3/ (L_over_r^2);

% Calculate sigma_cr
sigma_cr = (0.658 ^ (sigma_y  / sigma_e)) * sigma_y;

% Calculate allowable stress
sigma_all = sigma_cr / 1.67;

% Maximum allowable centric load
P_all = A * sigma_all; % in pounds

% Display the results
disp(['Allowable stress (sigma_all) = ', num2str(sigma_all), ' ksi']);
disp(['Maximum allowable centric load (P_all) = ', num2str(P_all), ' kips']);
