% Given Data
d_CD = 20; % mm
d_AB = 10; % mm
r_CD=300e-3;
T_B = 400; % N.m
L_CD = 300; % mm
L_AB = 270; % mm
G_steel = 77e9; % Pa
E = 200e9;
pi = 3.14;

% Convert diameters to meters for consistency in SI units
d_CD = d_CD / 1000; % meters
d_AB = d_AB / 1000; % meters

% Convert lengths to meters for consistency in SI units
L_CD = L_CD / 1000; % meters
L_AB = L_AB / 1000; % meters

% Calculate polar moment of inertia for both shafts
J_CD = (pi * d_CD^4) / 32; % m^4
J_AB = (pi * d_AB^4) / 32; % m^4

% Calculate forces using equilibrium equations
F_C = T_B / r_CD; % N
F_D = F_C; % N (since they are equal in magnitude)


% Calculate I:
I=(pi/4)*(d_CD/2)^4;

 % For CD
syms x
M=F_C * x;
U_CD= simplify(int((M)^2 / (2 * E * I), x, 0, L_CD));
U_CD0 = sym(U_CD);
U_CD = vpa(U_CD0);
disp(U_CD);
 
%For ADB
F_A1=(F_D * b)/L_AB;
F_A2=(F_D * a)/L_AB;

U_AB=simplify(((E*I)/2)*((int((F_A1)^2, x, 0, a))+(int((F_A2), x, 0, b))));
U_AB0 = sym(U_AB);
U_AB = vpa(U_AB0);
disp(U_AB);
% Calculate strain energy for CD segment
U_CD = (F_C^2 * L_CD^2) / (2 * G_steel * J_CD); % Joules

% Calculate strain energy for AB segment
U_AB = (F_C^2 * L_AB^2) / (2 * G_steel * J_AB); % Joules

% Total strain energy
U_total = U_CD + U_AB;

% Angle of twist calculation
phi_B = (2 * U_total) / T_B;

% Convert to degrees
phi_B_deg = rad2deg(phi_B);

% Display results
phi_B
phi_B_deg
