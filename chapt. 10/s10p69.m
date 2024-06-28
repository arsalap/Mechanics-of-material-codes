% Given data
c = 0.9;
K_CE = 0.418;
sigma_c = 10; % in MPa
E = 12000; % in MPa
b = 190; % in mm
d = 4 * 38; % in mm
A = b * d * 1e-6; % cross-sectional area in m^2

% Lengths in mm
L1 = 7 * 1e3; % 7 meters in mm
L2 = 3 * 1e3; % 3 meters in mm





L1_d_ratio = L1 / d;
L2_d_ratio = L2 / d;

sigma_CE1 = (K_CE * E) / (L1_d_ratio)^2;
sigma_CE2 = (K_CE * E) / (L2_d_ratio)^2;

sigma_ratio1 = sigma_CE1 / sigma_c;
sigma_ratio2 = sigma_CE2 / sigma_c;

u1 = (1 + sigma_ratio1) / (2 * c);
u2 = (1 + sigma_ratio2) / (2 * c);

v1 = sigma_ratio1 / c;
v2 = sigma_ratio2 / c;

Cp1 = u1 - sqrt(u1^2 - v1);
Cp2 = u2 - sqrt(u2^2 - v2);

sigma_all1 = Cp1 * sigma_c;
sigma_all2 = Cp2 * sigma_c;

P_all1 = sigma_all1 * A *1e3; % in N
P_all2 = sigma_all2 * A * 1e3; % in N

disp(['Allowable stress (sigma_all for L =3) = ', num2str(sigma_all1), 'Mpa']);
disp(['Maximum allowable centric load for L=3 (P_all) = ', num2str(P_all1), ' Kn']);

disp(['Allowable stress (sigma_all for L =7) = ', num2str(sigma_all2), ' Mpa']);
disp(['Maximum allowable centric load for L=7 (P_all) = ', num2str(P_all2), ' kN']);

