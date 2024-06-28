% Given data
Le_ft = 17; % ft
Le_in = Le_ft * 12; % in
P_kips = 235; % kips
sigma_y_ksi = 36; % ksi
E_ksi = 29000; % ksi

% Step 1: Calculate the required cross-sectional area A
A_req = (1.67 * P_kips) / sigma_y_ksi; % in^2

% Step 2: Calculate the slenderness ratio transition point
Le_over_r_trans = 4.71 * sqrt(E_ksi / sigma_y_ksi);

% Step 3: Try W10x54 section
A_W10x54 = 15.8; % in^2
I_y_W10x54 = 103; % in^4 (from calculation)
ry_W10x54 = 2.56; % in (given)

% Calculate slenderness ratio for W10x54
Le_over_r_W10x54 = Le_in / ry_W10x54;

% Calculate critical stress sigma_e
sigma_e_ksi = (pi^2 * E_ksi) / (Le_over_r_W10x54^2); % ksi

% Adjust sigma_e for the yield strength limit
if Le_over_r_W10x54 < Le_over_r_trans
    sigma_e_ksi = ((pi^2)*E_ksi)/(Le_over_r_W10x54)^2;
end

% Calculate allowable stress sigma_all
sigma_all_ksi = (1/1.67)*(0.658^(sigma_y_ksi/sigma_e_ksi)) * sigma_y_ksi; % ksi

% Step 4: Calculate allowable load Pall for W10x54
Pall_W10x54 = sigma_all_ksi * A_W10x54; % kips

% Display results
fprintf('Required cross-sectional area A: %.4f in^2\n', A_req);
fprintf('Slenderness ratio transition point: %.4f\n', Le_over_r_trans);
fprintf('Selected W10x54 section:\n');
fprintf('  Area A: %.4f in^2\n', A_W10x54);
fprintf('  Moment of Inertia I_min: %.4f in^4\n', I_y_W10x54);
fprintf('  Radius of Gyration r: %.4f in\n', ry_W10x54);
fprintf('  Slenderness ratio Le/r: %.4f\n', Le_over_r_W10x54);
fprintf('  Critical stress sigma_e: %.4f ksi\n', sigma_e_ksi);
fprintf('  Allowable stress sigma_all: %.4f ksi\n', sigma_all_ksi);
fprintf('  Allowable load Pall: %.4f kips\n', Pall_W10x54);

% Check if the section meets the requirements
if Pall_W10x54 > P_kips
    fprintf('The selected W10x54 section is suitable for the given load.\n');
else
    fprintf('The selected W10x54 section is not suitable for the given load.\n');
end
