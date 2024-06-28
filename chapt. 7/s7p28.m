%problem 28
% Given data
sigma_x = 10; % ksi
sigma_y = -8; % ksi
tau_max_allowed = 12; % ksi

% Calculate the largest value of tau_xy
tau_xy = sqrt(tau_max_allowed^2 - ((sigma_x - sigma_y) / 2)^2);

% Calculate principal stresses
sigma_avg = (sigma_x + sigma_y) / 2;
sigma_diff = (sigma_x - sigma_y) / 2;
principal_stress_1 = sigma_avg + sqrt(sigma_diff^2 + tau_xy^2);
principal_stress_2 = sigma_avg - sqrt(sigma_diff^2 + tau_xy^2);

% Display results
fprintf('Problem 7.28:\n');
fprintf('a) Largest value of tau_xy for which the maximum in-plane shearing stress is <= 12 ksi: %.2f ksi\n', tau_xy);
fprintf('b) Corresponding principal stresses: %.2f ksi, %.2f ksi\n', principal_stress_1, principal_stress_2);
