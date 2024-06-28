%problem 54
% Given stress states
sigma_x1 = 5; % ksi
sigma_y1 = -3; % ksi
tau_xy1 = -2; % ksi

sigma_1 = 6; % ksi (principal stress in the rotated state)
sigma_2 = -4; % ksi (principal stress in the rotated state)

% Rotation angle for the second stress state
theta = 45; % degrees

% Convert angle to radians
theta_rad = theta * pi / 180;

% Stress transformation equations to rotate back to the original coordinate system
sigma_x2 = (sigma_1 + sigma_2)/2 + (sigma_1 - sigma_2)/2 * cos(2*theta_rad);
sigma_y2 = (sigma_1 + sigma_2)/2 - (sigma_1 - sigma_2)/2 * cos(2*theta_rad);
tau_xy2 = (sigma_1 - sigma_2)/2 * sin(2*theta_rad);


sigma_x = sigma_x1 + sigma_x2;
sigma_y = sigma_y1 + sigma_y2;
tau_xy = tau_xy1 + tau_xy2;

% Mohr's circle calculations
sigma_avg = (sigma_x + sigma_y) / 2;
R = sqrt(((sigma_x - sigma_y) / 2)^2 + tau_xy^2);
sigma_1_final = sigma_avg + R; % Principal stress 1
sigma_2_final = sigma_avg - R; % Principal stress 2
tau_max = R; % Maximum shear stress

% Angle of principal planes
theta_p1 = atan2(2 * tau_xy, sigma_x - sigma_y) / 2;
theta_p1_deg = theta_p1 * 180 / pi; % Convert to degrees

% Display results
fprintf('Principal Stress 1: %.2f ksi\n', sigma_1_final);
fprintf('Principal Stress 2: %.2f ksi\n', sigma_2_final);
fprintf('Angle of Principal Plane 1: %.2f degrees\n', theta_p1_deg);
