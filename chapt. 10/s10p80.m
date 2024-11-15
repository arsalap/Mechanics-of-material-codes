% Given data
E = 200e9; % Modulus of elasticity in Pa
sigma_y = 250e6; % Yield stress in Pa
Le = 1.4; % Effective length in meters
P1 = 108e3; % Load in Newton for part (a)
P2 = 166e3; % Load in Newton for part (b)

% Constants
pi = 3.14;
Le_over_r = 4.71 * sqrt(E / sigma_y); % Transition factor for L_e/r

% Function to calculate d
calculate_d = @(P) nthroot( (4 * 1.67 * Le^2 * P) / (0.877* pi^2 * E) , 4 );

% Part (a)
d_part_a = calculate_d(P1);
Le_r_part_a = Le / (0.288675 * d_part_a);

% Part (b)
d_part_b = calculate_d(P2);
Le_r_part_b = Le / (0.288675 * d_part_b);

% Display the results
fprintf('Part (a):\n');
fprintf('  d = %.2f mm\n', d_part_a * 1e3);
fprintf('  L_e/r = %.2f\n', Le_r_part_a);

fprintf('Part (b):\n');
fprintf('  d = %.2f mm\n', d_part_b * 1e3);
fprintf('  L_e/r = %.2f\n', Le_r_part_b);
