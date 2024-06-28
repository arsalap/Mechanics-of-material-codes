% Given data
L = 3.5; % effective length in meters
b = 114; % width of cross section in mm
h = 140; % height of cross section in mm
sigma_c = 7.6e6; %Pa adjusted allowable stress for compression parallel to the grain in MPa
E = 2.8e9; % Pa adjusted modulus in MPa
c = 0.8; % constant

% Cross-sectional area in mm^2 and m^2
A = b * h; % in mm^2
A_m2 = A * 1e-6; % in m^2

% Radius of gyration
d = b; % in mm
d_m = d * 1e-3; % in meters

% Slenderness ratio
L_over_d = L / d_m;

% Critical stress for buckling in MPa
sigma_CE = 0.822 * E / (L_over_d)^2;

% Ratio of sigma_CE to sigma_c
sigma_ratio = sigma_CE / sigma_c;

% Calculation of u
u = (1 + sigma_ratio) / (2 * c);

% Calculation of v
v = sigma_ratio / c;

% Calculation of Cp
Cp = u - sqrt(u^2 - v);

% Allowable stress
sigma_all = Cp * sigma_c *1e-6;

% Maximum allowable centric load in N and kN
P_all = sigma_all * A_m2; % in N
P_all_kN = P_all * 1e3; % in kN

% Display the results
disp(['Allowable stress (sigma_all) = ', num2str(sigma_all), ' MPa']);
disp(['Maximum allowable centric load (P_all) = ', num2str(P_all_kN), ' kN']);
