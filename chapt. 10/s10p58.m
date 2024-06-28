% Given data
E = 29e3; % ksi (modulus of elasticity)
A = 9.12; % in^2 (area)
rmin = 2.02; % in (minimum radius of gyration)
Le = 252 ; % in (effective length)
FS = 1.67; % factor of safety

% Calculate the slenderness ratio (Le/r)
Le_r = Le / rmin;

% Calculate elastic critical stress (sigma_e)
sigma_e = (pi^2 * E) / (Le_r)^2;

% Case (a): sigma_y = 36 ksi
sigma_y1 = 36; % ksi
transition_Lr1 = 4.71 * sqrt(E / sigma_y1);

if Le_r < transition_Lr1 
    sigma_all1 = (1 / FS) * (0.658^(sigma_y1 / sigma_e)) * sigma_y1;
else
    sigma_all1 = (0.877 * sigma_e) / FS;
end

P_all1 = sigma_all1 * A;

% Case (b): sigma_y = 50 ksi
sigma_y2 = 50; % ksi
transition_Lr2 = 4.71 * sqrt(E / sigma_y2);

if Le_r < transition_Lr2
    sigma_all2 = (1 / FS) * (0.658^(sigma_y2 / sigma_e)) * sigma_y2;
else
    sigma_all2 = (0.877 * sigma_e) / FS;
end

P_all2 = sigma_all2 * A;

% Display results
fprintf('Case (a): sigma_y = 36 ksi\n');
fprintf('Transition L/r = %.2f\n', transition_Lr1);
fprintf('Allowable stress sigma_all = %.3f ksi\n', sigma_all1);
fprintf('Allowable load P_all = %.2f kips\n\n', P_all1);

fprintf('Case (b): sigma_y = 50 ksi\n');
fprintf('Transition L/r = %.2f\n', transition_Lr2);
fprintf('Allowable stress sigma_all = %.3f ksi\n', sigma_all2);
fprintf('Allowable load P_all = %.2f kips\n', P_all2);
