% Define symbolic variables
syms P L E I a b x v
% Reactions at supports
Ra = (P * b) / L;
Rb = (P * a) / L;

% Moment over AD section
M_AD = Ra * x;

% Strain energy over AD section
U_AD = int((M_AD^2) / (2 * E * I), x, 0, a);

% Moment over DB section
M_DB = Rb * v;

% Strain energy over DB section
U_DB = int((M_DB^2) / (2 * E * I), v, 0, b);

% Total strain energy
U_total = simplify(U_AD + U_DB);
U_total= subs(U_total,(a+b),L);

delta_D = simplify((2*U_total)/P);
% Display result
fprintf('U_AD = ');
disp(U_AD);
fprintf('U_total = ');
disp(U_total);
fprintf('U_DB = ');
disp(U_DB);
fprintf('Deflection at point D : \n');
disp(delta_D);




