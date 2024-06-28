% Given data
E = 29e3; % Modulus of elasticity in psi
sigma_y = 36; % Yield stress in ksi
Le = 15 * 12; % Effective length in inches
gamma_D = 1.2; % Dead load factor
gamma_L = 1.6; % Live load factor
phi = 0.90; % Resistance factor
P_D = 51; % Dead load in kips
P_L = 58; % Live load in kips
pi=3.14;

% Calculate required Pu
Pu = ((gamma_D * P_D) + (gamma_L * P_L)) / phi;

% Transition slenderness ratio
Le_over_r_transition = 4.71 * sqrt(E / sigma_y);

% Define function to calculate Pu for given thickness
calculate_Pu = @(t) (...
    (7.1094) * (0.658 ^ ( (pi^2 * E) / ((Le / (2.3254))^2))^((77.41^2)/(47.764)) ) ...
    * (26.26) * 1.5 ...
);

% Possible thicknesses in inches
thicknesses = [1/4, 5/16];

% Loop through thicknesses to find suitable one
for t = thicknesses
    % Dimensions
    b0 = 6; % Outer dimension in inches
    b1 = b0 - 2 * t; % Inner dimension in inches
    
    % Area
    A = b0^2 - b1^2;
    
    % Moment of Inertia
    I = (1/12) * (b0^4 - b1^4);
    
    % Radius of Gyration
    r = sqrt(I / A);
    
    % Slenderness Ratio
    Le_over_r = Le / r;
    
    % Elastic Critical Stress
    sigma_e = (pi^2 * E) / (Le_over_r)^2;
    
    % Inelastic Critical Stress
    if Le_over_r < Le_over_r_transition
        sigme_e = ((pi^2)*E)/((Le_over_r)^2);
        sigma_cr = 0.658^(sigma_y / sigma_e) * sigma_y;
    else 
        sigma_cr = sigma_y;
    end
    
    % Calculate Pu
    Pu_calculated = A * sigma_cr;
    
    % Check if Pu_calculated meets the requirement
    if Pu_calculated > Pu
        fprintf('Thickness t = %.3f inches is suitable.\n', t);
        fprintf('  A = %.4f in^2\n', A);
        fprintf('  I = %.4f in^4\n', I);
        fprintf('  r = %.4f in\n', r);
        fprintf('  Le/r = %.2f\n', Le_over_r);
        fprintf('  sigma_e = %.2f ksi\n', sigma_e);
        fprintf('  sigma_cr = %.2f ksi\n', sigma_cr);
        fprintf('  Pu_calculated = %.2f kips\n', Pu_calculated);
        break;
    end
end
