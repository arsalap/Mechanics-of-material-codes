% Define symbolic variables
syms x a w E I

% Bending moment equation for portion AB (0 <= x <= 2a)
M_AB = (1/2)*w*x^2 - (4/3)*w*a*x;

% Differential equation for the elastic curve
EI = E * I;
d2y_AB = M_AB / EI;

% Integrate to find the slope (dy/dx)
C1 = sym('C1');
dy_AB = int(d2y_AB, x) + C1;

% Integrate again to find the deflection (y)
C2 = sym('C2');
y_AB = int(dy_AB, x) + C2;

% Apply boundary conditions at A (x = 0)
% At A (x = 0), y = 0 and dy/dx = 0
C1_value = solve(subs(dy_AB, x, 0) == 0, C1);
dy_AB = subs(dy_AB, C1, C1_value);

C2_value = solve(subs(y_AB, x, 0) == 0, C2);
y_AB = subs(y_AB, C2, C2_value);

% Simplify the equations
y_AB = simplify(y_AB);
dy_AB = simplify(dy_AB);

% Display the elastic curve equation
fprintf('Elastic curve equation for portion AB:\n');
disp(y_AB);

% Deflection and slope at B (x = 2a)
x_B = 2 * a;
deflection_B = simplify(subs(y_AB, x, x_B));
slope_B = simplify(subs(dy_AB, x, x_B));

fprintf('Deflection at B: \n');
disp(deflection_B);

fprintf('Slope at B: \n');
disp(slope_B);
