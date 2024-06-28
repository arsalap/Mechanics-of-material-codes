# question 7-17
#Amir Arsalan Bayat

import math

# ورودی‌ها
sigma_x = 0  # تنش عمودی در جهت x (psi)
sigma_y = 0  # تنش عمودی در جهت y (psi)
tau_xy = 250  # تنش برشی در صفحه xy (psi)
theta_degrees = -15  # زاویه شیب با عمود (درجه)

# تبدیل زاویه از درجه به رادیان
theta_radians = math.radians(theta_degrees)

# محاسبات بر اساس معادلات داده شده
tau_xy_result = sigma_y / 2 * math.sin(2 * theta_radians) + tau_xy * math.cos(2 * theta_radians)
sigma_x_prime_result = sigma_x + sigma_y / 2 - sigma_y / 2 * math.cos(2 * theta_radians) + tau_xy * math.sin(2 * theta_radians)

# نمایش نتایج
print(f"Tau-x'y': {tau_xy_result} psi")
print(f"SIGMA X': {sigma_x_prime_result} psi")