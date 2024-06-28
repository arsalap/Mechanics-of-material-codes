% Given data
w = 50e3; % N/m
a = 2; % m
E = 200e9; % Pa
I = 84.9e-6; % m^4
L = 6; % m

% Define symbolic variables
syms x C1 C2 C3 C4

% Reaction forces
R_B =  w * a; % N
R_A = (5/6) * w * a; % N

% Bending moment equations
% For 0 <= x <= a
M_1 = (R_A * x)- ((w * x^2) / 2);

% For a <= x <= L
M_2 = R_B * (L - x);

% Differential equation for the elastic curve
EI = E * I;

% For 0 <= x <= a
d2y_1 = vpa(M_1 / EI);
dy_1 = vpa(int(d2y_1, x) + C1);
y_1 = vpa(int(dy_1, x) + C2);

% For a <= x <= L
d2y_2 = vpa(M_2 / EI);
dy_2 = vpa(int(d2y_2, x) + C3);
y_2 = vpa(int(dy_2, x) + C4);

% Apply boundary conditions
% At x = 0, y = 0
C2_value = vpa(solve(subs(y_1, x, 0) == 0, C2));
y_1 = subs(y_1, C2, C2_value);
dy_1 = subs(dy_1, C2, C2_value);

% At x = 0, dy/dx = 0
C1_value = vpa(solve(subs(dy_1, x, 0) == 0, C1));
y_1 = subs(y_1, C1, C1_value);
dy_1 = subs(dy_1, C1, C1_value);

% At x = a, y = y
y_value = vpa(subs(y_1, x, a));
dy_value = vpa(subs(dy_1, x, a));

% Matching conditions at x = a
C4_value = vpa(solve(subs(y_2, x, a) == y_value, C4));
y_2 = subs(y_2, C4, C4_value);
dy_2 = subs(dy_2, C4, C4_value);

C3_value = vpa(solve(subs(dy_2, x, a) == dy_value, C3));
y_2 = subs(y_2, C3, C3_value);
dy_2 = subs(dy_2, C3, C3_value);

% Display the elastic curve equations
fprintf('Elastic curve equation for 0 <= x <= a:\n');
disp(vpa(y_1));

fprintf('Elastic curve equation for a <= x <= L:\n');
disp(vpa(y_2));

% Slope at x = 0
theta_A = simplify(subs(dy_1, x, 0));
fprintf('Slope at A (x = 0): \n');
disp(vpa(theta_A));

% Deflection at x = 2 (point C)
deflection_C = simplify(subs(y_2, x, 2));
fprintf('Deflection at C (x = 2): \n');
disp(vpa(deflection_C));
