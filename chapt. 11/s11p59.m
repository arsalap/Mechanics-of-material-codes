syms P E I L a 
U = ((P^2 * a^2)/ (6*E*I))*(a + L);
% Calculate the deflection y_D at point D
y_D = (U/P)*2;

% Display the result
fprintf('The deflection y_D at point D is: \n')
disp(y_D);
