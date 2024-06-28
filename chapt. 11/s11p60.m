% Define symbolic variables
syms M0 L E I a b x v

% Define the moment equations
M_AD = M0 * x / L; % Moment over portion AD
M_DB = M0 * v / L; % Moment over portion DB

% Calculate strain energy over portion AD
U_AD = int((M_AD^2) / (2 * E * I), x, 0, a);

% Calculate strain energy over portion DB
U_DB = int((M_DB^2) / (2 * E * I), v, 0, b);

% Total strain energy
U_total = U_AD + U_DB;

% Solve for the slope at point D
theta_D = 2 * U_total / M0;

% Simplify the expression for theta_D
theta_D = simplify(theta_D);

% Display the result
disp('The slope at point D (theta_D) is:');
disp(theta_D);
