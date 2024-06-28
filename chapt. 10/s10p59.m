% Given data
B = 127e-3; % Outer width in meters
H = 178e-3; % Outer height in meters
t = 8e-3;   % Thickness in meters
E = 200e9;  % Young's modulus in Pascals
b = B - (2 *t); % Inner width in meters
h= H- (2*t); % Inner width in meters
sigma_y = 250e6; % Yield stress in Pascals
L = 5; % Effective length in meters
factor_of_safety = 1.67;

% Area of cross-section
A = (H * B) - (h * b);

% Moment of inertia (Iy)
Iy = (1/12) * (H * B^3 - h * b^3);

% Radius of gyration (r)
r = sqrt(Iy / A);

% Slenderness ratio (Le/r)
Le = L;
slenderness_ratio = Le / r;

% Critical stress (sigma_e)
sigma_e = (pi^2 * E) / (slenderness_ratio^2);

% Allowable stress (sigma_cr) based on given formula
sigma_cr = (0.658^(sigma_y / sigma_e)) * sigma_y;

% Allowable load (P_all)
P_all = (sigma_cr * A) / factor_of_safety;

% Convert to kN
P_all_kN = P_all / 1e3;

% Display results
disp(['Area of cross-section (A): ', num2str(A), ' m^2']);
disp(['Moment of inertia (Iy): ', num2str(Iy), ' m^4']);
disp(['Radius of gyration (r): ', num2str(r), ' m']);
disp(['Slenderness ratio (Le/r): ', num2str(slenderness_ratio)]);
disp(['Critical stress (sigma_e): ', num2str(sigma_e / 1e6), ' MPa']);
disp(['Allowable stress (sigma_cr): ', num2str(sigma_cr / 1e6), ' MPa']);
disp(['Allowable load (P_all): ', num2str(P_all_kN), ' kN']);
