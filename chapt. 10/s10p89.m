% Given data
d = 0.06; % Diameter in meters
c = d / 2; % Radius in meters
L = 1.2; % Length in meters
e = 0.022; % Eccentricity in meters
E = 200e3; % Modulus of Elasticity in MPa
sigma_y = 250; % Yield strength in MPa
pi=3.14;

% Cross-sectional area and moment of inertia
A = pi * c^2;
I = (pi / 4) * c^4;
r = sqrt(I/A);
L_over_r = L/r;

% Slenderness ratio
Le = L; % Effective length is the same as length for pinned-pinned condition
L_over_r_transition = 4.71 * sqrt(E/sigma_y);

% Elastic critical stress
sigma_e = (pi^2 * E) / (L_over_r^2);

% Critical buckling stress
sigma_cr = (0.658^(sigma_y / sigma_e) * sigma_y); %MPa

% Allowable stress
sigma_all = sigma_cr / 1.67; %MPa

% Eccentric loading calculation
P_all = (sigma_all * 1e6 * A) / 1/(1 + ((e * 1e3)*(c *1e3)) /(r*1e3)^2);

% Display the results
fprintf('Cross-sectional area A = %.4e m^2\n', A);
fprintf('Moment of inertia I = %.4e m^4\n', I);
fprintf('Slenderness ratio Le/r = %.2f\n', L_over_r);
fprintf('Elastic critical stress sigma_e = %.2f MPa\n', sigma_e);
fprintf('Critical buckling stress sigma_cr = %.2f MPa\n', sigma_cr);
fprintf('Allowable stress sigma_all = %.2f MPa\n', sigma_all);
fprintf('Allowable load P = %.2f kN\n', P_all /1e3 );
