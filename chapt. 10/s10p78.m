% Given data
Le_ft = 22.5; % ft
Le_in = Le_ft * 12; % in
P_kips = 288; % kips
sigma_y_ksi = 50; % ksi
E_ksi = 29000; % ksi

% Step 1: Calculate the required cross-sectional area A
A_req = (1.67 * P_kips) / sigma_y_ksi; % in^2

% Step 2: Calculate the slenderness ratio transition point
Le_over_r_trans = 4.71 * sqrt(E_ksi / sigma_y_ksi);

% Step 3: Try W14x82 section
A_W14x82 = 24.0; % in^2
I_min_W14x82 = 148; % in^4
r_W14x82 = sqrt(I_min_W14x82 / A_W14x82); % in

% Calculate slenderness ratio for W14x82
Le_over_r_W14x82 = Le_in / r_W14x82;

sigma_e_ksi = (pi^2 * E_ksi) / (Le_over_r_W14x82^2); % ksi


if Le_over_r_W14x82 < Le_over_r_trans
    sigma_cr_ksi = (0.658^(sigma_y_ksi/sigma_e_ksi)) * sigma_y_ksi;
end

% Step 4: Calculate allowable load Pall for W14x82
Pall_W14x82 = (sigma_cr_ksi * A_W14x82) / 1.67; % kips

% Display results
fprintf('Required cross-sectional area A: %.4f in^2\n', A_req);
fprintf('Slenderness ratio transition point: %.4f\n', Le_over_r_trans);
fprintf('Selected W14x82 section:\n');
fprintf('  Area A: %.4f in^2\n', A_W14x82);
fprintf('  Moment of Inertia I_min: %.4f in^4\n', I_min_W14x82);
fprintf('  Radius of Gyration r: %.4f in\n', r_W14x82);
fprintf('  Slenderness ratio Le/r: %.4f\n', Le_over_r_W14x82);
fprintf('  Critical stress sigma_cr: %.4f ksi\n', sigma_cr_ksi);
fprintf('  Allowable load Pall: %.4f kips\n', Pall_W14x82);

% Check if the section meets the requirements
if Pall_W14x82 > P_kips
    fprintf('The selected W14x82 section is suitable for the given load.\n');
else
    fprintf('The selected W14x82 section is not suitable for the given load.\n');
end
