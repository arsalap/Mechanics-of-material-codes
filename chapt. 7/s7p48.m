%problem 48
% Given data
D = 102; % mm
t = 6; % mm
F = 10e3; % N
L = 200; % mm (distance from A to C)
y = 150; % mm (distance from A to K)
r0=D/2;%mm
ri=r0-t;
c = r0; % m 

J = pi/2 * (r0^4 - ri^4); % mm^4
I = J/2; % mm^4

My= (10e3)*(200e-3);%N.m
Mz=-(10e3)*(150e-3);%N.m
T=My;


% Stress calculations
sigma_y = Mz * c *10^3/ I; % Bending stress in MPa
sigma_x = 0;
tau_xy = (T*c*10^3)/J; % Mpa

% Principal stresses and maximum shear stress
sigma_avg = (sigma_x + sigma_y) / 2;
R = sqrt(((sigma_x - sigma_y) / 2)^2 + tau_xy^2);
sigma_max = sigma_avg + R; % Principal stress 1
sigma_min = sigma_avg - R; % Principal stress 2
tau_max = R; % Maximum shear stress

% Display results
fprintf('Principal Stress 1: %.2f MPa\n', sigma_max);
fprintf('Principal Stress 2: %.2f MPa\n', sigma_min);
fprintf('Maximum Shear Stress: %.2f MPa\n', tau_max);
