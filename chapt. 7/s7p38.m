%problem 38
% Given data
sigma_x = 0; % MPa
sigma_y = -80; % MPa
tau_xy = -50; % MPa

% Rotation angles in degrees
theta_clockwise = -25; % clockwise
theta_counterclockwise = 10; % counterclockwise

% Convert angles to radians
theta_clockwise_rad = deg2rad(theta_clockwise);
theta_counterclockwise_rad = deg2rad(theta_counterclockwise);

% Transformation equations
sigma_avg = (sigma_x + sigma_y) / 2;
sigma_diff = (sigma_x - sigma_y) / 2;

% For 25 degrees clockwise
sigma_x_prime_clockwise = sigma_avg + sigma_diff * cos(2 * theta_clockwise_rad) + tau_xy * sin(2 * theta_clockwise_rad);
sigma_y_prime_clockwise = sigma_avg - sigma_diff * cos(2 * theta_clockwise_rad) - tau_xy * sin(2 * theta_clockwise_rad);
tau_xy_prime_clockwise = -sigma_diff * sin(2 * theta_clockwise_rad) + tau_xy * cos(2 * theta_clockwise_rad);

% For 10 degrees counterclockwise
sigma_x_prime_counterclockwise = sigma_avg + sigma_diff * cos(2 * theta_counterclockwise_rad) + tau_xy * sin(2 * theta_counterclockwise_rad);
sigma_y_prime_counterclockwise = sigma_avg - sigma_diff * cos(2 * theta_counterclockwise_rad) - tau_xy * sin(2 * theta_counterclockwise_rad);
tau_xy_prime_counterclockwise = -sigma_diff * sin(2 * theta_counterclockwise_rad) + tau_xy * cos(2 * theta_counterclockwise_rad);

% Display results
fprintf('Problem 7.38:\n');
fprintf('For 25 degrees clockwise:\n');
fprintf('Normal stress sigma_x_prime: %.2f MPa\n', sigma_x_prime_clockwise);
fprintf('Normal stress sigma_y_prime: %.2f MPa\n', sigma_y_prime_clockwise);
fprintf('Shear stress tau_xy_prime: %.2f MPa\n', tau_xy_prime_clockwise);

fprintf('For 10 degrees counterclockwise:\n');
fprintf('Normal stress sigma_x_prime: %.2f MPa\n', sigma_x_prime_counterclockwise);
fprintf('Normal stress sigma_y_prime: %.2f MPa\n', sigma_y_prime_counterclockwise);
fprintf('Shear stress tau_xy_prime: %.2f MPa\n', tau_xy_prime_counterclockwise);
