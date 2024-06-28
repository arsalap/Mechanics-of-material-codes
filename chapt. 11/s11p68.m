% Given Data
T_A = 750; % lb-in
L_AB = 11; % in
d= 0.75; % in
G = 11.2e6; % psi
L_EF = 8; % in
T_DE = 1000; % lb-in
r_B = 3;
r_E = 4;

% Constants
J_AB = (pi / 2)* (d/2)^4;  % in^4
T_AB = T_A;
T_B = T_AB;
% Calculations
U_AB = (T_A^2 * L_AB) / (2 * G * J_AB); % strain energy for segment AB
U_BC = 0;
F_BE = T_B / r_B;
T_E = r_E * F_BE;
U_DE=0;
T_EF = T_E;
 
J_EF = (pi/2)*(d/2)^4;
U_EF = (T_DE^2 * L_EF) / (2 * G * J_EF); % strain energy for segment EF

% Total strain energy
U_total = U_AB + U_EF + U_BC + U_DE;

% Angle of twist calculation
phi_A = (2 * U_total) / T_A;

% Convert to degrees
phi_A_deg = rad2deg(phi_A);

% Display results
phi_A
phi_A_deg 
