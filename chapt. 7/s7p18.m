%problem 18
% Constants
theta = -15; % angle in degrees
theta_rad = deg2rad(theta); % convert angle to radians

% Given values for Problem 7.18
sigma_x = -3; % MPa
sigma_y = -1.8; % MPa
tau_xy = 0; % MPa

% Transformation equations
sigma_x_prime = (sigma_x + sigma_y)/2 + (sigma_x - sigma_y)/2 * cos(2*theta_rad) + tau_xy * sin(2*theta_rad);
sigma_y_prime = (sigma_x + sigma_y)/2 - (sigma_x - sigma_y)/2 * cos(2*theta_rad) - tau_xy * sin(2*theta_rad);
tau_xy_prime = -(sigma_x - sigma_y)/2 * sin(2*theta_rad) + tau_xy * cos(2*theta_rad);

% Display the results
fprintf('Problem 7.18:\n');
fprintf('In-plane shearing stress parallel to the grain: %.2f MPa\n', tau_xy_prime);
fprintf('Normal stress perpendicular to the grain: %.2f MPa\n', sigma_x_prime);
